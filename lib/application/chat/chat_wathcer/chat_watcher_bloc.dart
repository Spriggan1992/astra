import 'dart:async';

import 'package:astra_app/application/core/enums/loading_states.dart';
import 'package:astra_app/domain/chats/i_chat_repository.dart';
import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/models/subscription_model.dart';
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
  StreamSubscription<Either<AstraFailure, SubscriptionModel<MessageModel>>>?
      _signalSubscription;
  StreamSubscription<dynamic>? _internetConnectionSubscription;
  ChatWatcherBloc(
    this._internetConnectionService,
    this._chatRepo,
  ) : super(ChatWatcherState.initila()) {
    on<ChatWatcherEvent>((event, emit) async {
      await event.map(
        initialized: (e) async {
          emit(state.copyWith(chatMessages: e.messages, chatId: e.chatId));
          add(const ChatWatcherEvent.internetConnectionStartedWatch());
        },
        chatStartedWatch: (e) async {
          _signalSubscription =
              _chatRepo.subscribeToChatsUpdates(state.chatId).listen(
            (snapshot) {
              add(ChatWatcherEvent.chatRecived(snapshot));
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
        chatRecived: (e) async {
          emit(
            e.messageOrFailure.fold(
              (failure) => failure.map(
                  api: (_) => state.copyWith(
                      loadingStates: LoadingStates.unexpectedFailure),
                  noConnection: (_) => state.copyWith(
                      loadingStates: LoadingStates.noConnectionFailure)),
              (subscriptionModel) {
                final updatedMessages = _setMessages(
                  state.chatMessages,
                  subscriptionModel.item!,
                );
                return state.copyWith(chatMessages: updatedMessages);
              },
            ),
          );
        },
        messageSent: (e) async {
          final response = await _chatRepo.sendMessage(state.chatId, e.message);
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
      );
    });
  }
  List<MessageModel> _setMessages(
      List<MessageModel> initialMessages, MessageModel message) {
    List<MessageModel> messages = List.from(initialMessages);
    messages.insert(0, message);
    return messages;
  }

  @override
  Future<void> close() async {
    await _signalSubscription?.cancel();
    await _internetConnectionSubscription?.cancel();
    await _internetConnectionService.dispose();
    return super.close();
  }
}
