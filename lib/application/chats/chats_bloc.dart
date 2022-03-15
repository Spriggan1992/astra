import 'dart:async';

import 'package:astra_app/application/chats/enums/chats_loading_statuses.dart';
import 'package:astra_app/application/chats/enums/chat_opening_statuses.dart';
import 'package:astra_app/application/chats/enums/delete_statuses.dart';
import 'package:astra_app/application/core/extensions/sort_chats.dart';
import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/domain/chats/repositories/i_chats_repository.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chats_event.dart';
part 'chats_state.dart';
part 'chats_bloc.freezed.dart';

@injectable
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final IChatsRepository _chatsRepository;
  StreamSubscription? _subscription;
  ChatsBloc(this._chatsRepository) : super(ChatsState.initial()) {
    on<ChatsEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            add(const ChatsEvent.watchStarted());
          },
          watchStarted: (e) async {
            final response = await _chatsRepository.getTopics();
            response.fold(
              (failure) => emit(_mapFailure(failure, state)),
              (topicModel) {
                if (topicModel.topics.isNotEmpty) {
                  _subscription = null;
                  _subscription = _chatsRepository
                      .subscribeToChatsUpdates(topicModel)
                      .listen(
                    (snapshot) {
                      add(const ChatsEvent.chatsUpdated());
                    },
                  );
                }
              },
            );
          },
          chatsUpdated: (e) async {
            final response = await _chatsRepository.getChats();
            emit(
              response.fold(
                (failure) => _mapFailure(failure, state),
                (chats) {
                  final updatedChats = chats.sortChats;
                  final hasNewMessage = updatedChats
                      .any((element) => element.newMessageCount > 0);
                  return state.copyWith(
                    chats: updatedChats,
                    hasNewMessage: hasNewMessage,
                  );
                },
              ),
            );
          },
          chatsLoaded: (e) async {
            emit(state.copyWith(loadingStatuses: ChatLoadingStatuses.loading));
            final response = await _chatsRepository.getChats();
            emit(
              response.fold(
                (failure) => _mapFailure(failure, state),
                (chats) {
                  final updatedChats = chats.sortChats;
                  final hasNewMessage = updatedChats
                      .any((element) => element.newMessageCount > 0);
                  return state.copyWith(
                    chats: updatedChats,
                    loadingStatuses: ChatLoadingStatuses.success,
                    hasNewMessage: hasNewMessage,
                  );
                },
              ),
            );
          },
          chatDeleted: (e) async {
            final response = await _chatsRepository.deleteChat(e.chatId);
            response.fold(
              (l) => emit(state.copyWith(deleteStatus: DeleteStatus.failure)),
              (r) => add(const ChatsEvent.chatsUpdated()),
            );
          },
          chatsUnsubscribed: (e) async {
            await _subscription!.cancel();
            _subscription = null;
            await _chatsRepository.dispose();
          },
          existenceChatChecked: (e) async {
            final chat = state.chats
                .firstWhereOrNull((element) => element.userId == e.userId);
            if (chat == null) {
              add(
                ChatsEvent.createChat(e.userId),
              );
            } else {
              emit(state.copyWith(
                  chat: chat, chatOpeningStatuses: ChatOpeningStatuses.success));
              emit(state.copyWith(
                  chatOpeningStatuses: ChatOpeningStatuses.initial));
            }
          },
          createChat: (e) async {
            emit(
              state.copyWith(chatOpeningStatuses: ChatOpeningStatuses.loading),
            );

            final response = await _chatsRepository.openChat(e.userId);
            response.fold(
                (failure) => emit(state.copyWith(
                    chatOpeningStatuses: ChatOpeningStatuses.failure)),
                (chatModel) => add(ChatsEvent.chatOpened(chatModel)));
          },
          chatOpened: (e) async {
            emit(state.copyWith(
                chat: e.chatModel,
                chatOpeningStatuses: ChatOpeningStatuses.success));
            emit(state.copyWith(
                chatOpeningStatuses: ChatOpeningStatuses.initial));
          },
        );
      },
    );
  }
  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await _chatsRepository.dispose();
    return super.close();
  }

  ChatsState _mapFailure(AstraFailure failure, ChatsState state) {
    return failure.map(
      api: (_) => state.copyWith(
          loadingStatuses: ChatLoadingStatuses.unexpectedFailure),
      noConnection: (_) => state.copyWith(
          loadingStatuses: ChatLoadingStatuses.connectionFailure),
    );
  }
}
