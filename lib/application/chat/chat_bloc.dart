import 'dart:async';

import 'package:astra_app/application/core/enums/loading_states.dart';
import 'package:astra_app/domain/chats/i_chat_repository.dart';
import 'package:astra_app/domain/chats/i_chat_service.dart';
import 'package:astra_app/domain/chats/message_model.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/core/services/i_ineternet_connection_status.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final IChatRepository _chatRepository;
  final IChatService _chatService;
  final IInternetConnectionService _internetConnectionService;
  StreamSubscription<dynamic>? _websocketSubscription;
  StreamSubscription<dynamic>? _internetConnectionSubscription;

  ChatBloc(
    this._chatRepository,
    this._chatService,
    this._internetConnectionService,
  ) : super(ChatState.initial()) {
    on<ChatEvent>(
      (event, emit) async {
        await event.map(
          chatHistoryLoaded: (e) async {
            emit(state.copyWith(loadingStates: LoadingStates.loading));
            final response = await _chatRepository.getChatHisory(e.chatId);
            emit(
              response.fold(
                (failure) => failure.map(
                  api: (_) => state.copyWith(
                      loadingStates: LoadingStates.unexpectedFailure),
                  noConnection: (_) => state.copyWith(
                      loadingStates: LoadingStates.noConnectionFailure),
                ),
                (messages) {
                  return state.copyWith(
                    chatMessages: messages,
                    loadingStates: LoadingStates.success,
                  );
                },
              ),
            );
            _internetConnectionSubscription =
                _internetConnectionService.subscribeConnection().listen(
              (hasConnection) async {
                add(
                  ChatEvent.internetConnectionStatusSubscribed(hasConnection),
                );
                if (hasConnection) {
                  add(ChatEvent.connectToChat(e.chatId));
                } else {
                  await _websocketSubscription?.cancel();
                  await _chatService.closeChannel();
                }
              },
            );
          },
          internetConnectionStatusSubscribed: (e) async {
            emit(state.copyWith(hasConnection: e.hasConnection));
          },
          connectToChat: (e) async {
            await _chatService.setChatId(e.chatId);
            _websocketSubscription =
                _chatService.subscribeToWebsocketChennel().listen(
              (messageOrFailre) {
                add(ChatEvent.chatRecived(messageOrFailre));
              },
            );
          },
          chatRecived: (e) async {
            e.messageOrFailure.fold(
              (failure) {
                emit(
                  failure.map(
                    api: (_) => state.copyWith(
                        loadingStates: LoadingStates.unexpectedFailure),
                    noConnection: (_) => state.copyWith(
                        loadingStates: LoadingStates.noConnectionFailure),
                  ),
                );
              },
              (message) {
                emit(
                  state.copyWith(
                    chatMessages: _setMessages(state.chatMessages, message),
                  ),
                );
              },
            );
          },
          sendMessage: (e) async {
            await _chatService.sendMessage(e.message);
          },
        );
      },
    );
  }
  List<MessageModel> _setMessages(
      List<MessageModel> initialMessages, MessageModel message) {
    List<MessageModel> messages = List.from(initialMessages);
    messages.insert(0, message);
    return messages;
  }

  @override
  Future<void> close() async {
    await _websocketSubscription?.cancel();
    await _chatService.closeChannel();
    await _internetConnectionSubscription?.cancel();
    await _internetConnectionService.dispose();
    return super.close();
  }
}
