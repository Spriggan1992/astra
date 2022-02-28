import 'dart:async';
import 'dart:developer';

import 'package:astra_app/application/core/enums/loading_states.dart';
import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/domain/chats/models/message_model.dart';
import 'package:astra_app/domain/chats/models/pagination_chat_model.dart';
import 'package:astra_app/domain/chats/repositories/i_chat_repository.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscriptions/i_subscription_model.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_message_model.dart';
import 'package:astra_app/domain/core/models/subscriptions/subscription_status_online_model.dart';
import 'package:astra_app/domain/core/services/i_ineternet_connection_status.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_watcher_event.dart';
part 'chat_watcher_state.dart';
part 'chat_watcher_bloc.freezed.dart';

@injectable
class ChatWatcherBloc extends Bloc<ChatWatcherEvent, ChatWatcherState> {
  final IChatRepository _chatRepo;
  final IInternetConnectionService _internetConnectionService;
  StreamSubscription<Either<AstraFailure, ISubscriptionModel>>? _subscription;
  StreamSubscription<dynamic>? _internetConnectionSubscription;
  ChatWatcherBloc(
    this._internetConnectionService,
    this._chatRepo,
  ) : super(ChatWatcherState.initial()) {
    on<ChatWatcherEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            emit(
              state.copyWith(
                paginationResult: e.paginationResult,
                chatId: e.chatModel.id,
                isOnline: e.chatModel.isOnline,
              ),
            );
            add(const ChatWatcherEvent.internetConnectionStartedWatch());
          },
          chatStartedWatch: (e) async {
            _subscription =
                _chatRepo.subscribeToChatsUpdates(state.chatId).listen(
              (snapshot) {
                snapshot.fold(
                    (failure) => failure.map(
                        api: (_) => state.copyWith(
                            loadingStates: LoadingStates.unexpectedFailure),
                        noConnection: (_) => state.copyWith(
                            loadingStates: LoadingStates.noConnectionFailure)),
                    (subscription) {
                  if (subscription is SubscriptionMessageModel) {
                    log(snapshot.toString(), name: 'subModelOrFailure 1');
                    add(ChatWatcherEvent.chatReceived(subscription));
                  }
                  if (subscription is SubscriptionStatusOnlineModel) {
                    log(snapshot.toString(), name: 'subModelOrFailure 2');
                    add(ChatWatcherEvent.statusOnlineReceived(subscription));
                  }
                });
              },
            );
          },
          internetConnectionStartedWatch: (e) async {
            _internetConnectionSubscription =
                _internetConnectionService.subscribeConnection().listen(
              (hasConnection) async {
                add(ChatWatcherEvent.internetConnectionStatusConnectionChanged(
                    hasConnection));
                if (hasConnection) {
                  add(const ChatWatcherEvent.chatStartedWatch());
                }
              },
            );
          },
          statusOnlineReceived: (e) async {
            emit(state.copyWith(isOnline: e.onlineStatus.isOnline));
          },
          chatReceived: (e) async {
            final updatedMessages = _setMessages(
              state.paginationResult.chatMessages.messages,
              e.message.messageModel,
            );
            emit(
              state.copyWith(
                paginationResult: state.paginationResult.copyWith(
                  chatMessages: state.paginationResult.chatMessages
                      .copyWith(messages: updatedMessages),
                ),
              ),
            );
            add(const ChatWatcherEvent.chatRead());
          },
          chatRead: (e) async {
            await _chatRepo.readMessage(state.chatId);
          },
          messageSent: (e) async {
            final response =
                await _chatRepo.sendMessage(state.chatId, e.message);
            response.fold(
              (failure) => failure.map(
                api: (_) => null,
                noConnection: (_) => emit(
                  state.copyWith(hasConnection: false),
                ),
              ),
              (_) => emit(
                state.copyWith(hasConnection: true),
              ),
            );
          },
          internetConnectionStatusConnectionChanged: (e) async {
            emit(state.copyWith(hasConnection: e.hasConnection));
          },
          nextMessagesLoaded: (e) async {
            emit(state.copyWith(
                isNextMessagesLoaded: true, isAvailableToLoad: false));
            final offset = await _getOffset(
                state.paginationResult.count,
                state.paginationResult.chatMessages.messages.length,
                state.offset);
            if (offset != 0) {
              final response =
                  await _chatRepo.getChatHistory(state.chatId, offset);
              emit(
                response.fold(
                  (l) => state.copyWith(),
                  (r) {
                    return state.copyWith(
                      paginationResult: state.paginationResult.copyWith(
                          chatMessages:
                              state.paginationResult.chatMessages.copyWith(
                        messages: [
                          ...state.paginationResult.chatMessages.messages,
                          ...r.chatMessages.messages
                        ],
                      )),
                      isNextMessagesLoaded: false,
                      isAvailableToLoad: true,
                    );
                  },
                ),
              );
            } else {
              emit(state.copyWith(
                isNextMessagesLoaded: false,
                isAvailableToLoad: true,
              ));
            }
          },
        );
      },
    );
  }

  Future<int> _getOffset(
      int totalCount, int loadedAmountMessages, int currentOffset) async {
    if ((totalCount - loadedAmountMessages) > 20) {
      return loadedAmountMessages + 20;
    } else if (totalCount <= loadedAmountMessages ||
        (totalCount - loadedAmountMessages) == 20) {
      return 0;
    } else {
      return totalCount - loadedAmountMessages;
    }
  }

  List<MessageModel> _setMessages(
      List<MessageModel> initialMessages, MessageModel message) {
    List<MessageModel> messages = List.from(initialMessages);
    messages.insert(0, message);
    return messages;
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await _internetConnectionSubscription?.cancel();
    await _internetConnectionService.dispose();
    return super.close();
  }
}
