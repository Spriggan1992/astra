import 'dart:async';

import 'package:astra_app/application/chats/chats_loading_statuses.dart';
import 'package:astra_app/application/chats/delete_statuses.dart';
import 'package:astra_app/application/core/extensions/sort_chats.dart';
import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/domain/chats/repositories/i_chats_repository.dart';
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
                (failure) => emit(failure.map(
                    api: (_) => state.copyWith(
                        loadingStatuses: ChatLoadingStatuses.unexpectedFailure),
                    noConnection: (_) => state.copyWith(
                        loadingStatuses: ChatLoadingStatuses
                            .connectionFailure))), (topicModel) {
              if (topicModel.topics.isNotEmpty) {
                _subscription = null;
                _subscription =
                    _chatsRepository.subscribeToChatsUpdates(topicModel).listen(
                  (snapshot) {
                    add(const ChatsEvent.chatsUpdated());
                  },
                );
              }
            });
          },
          chatsUpdated: (e) async {
            final response = await _chatsRepository.getChats();
            emit(
              response.fold(
                (failure) => failure.map(
                    api: (_) => state.copyWith(
                        loadingStatuses: ChatLoadingStatuses.unexpectedFailure),
                    noConnection: (_) => state.copyWith(
                        loadingStatuses:
                            ChatLoadingStatuses.connectionFailure)),
                (chats) {
                  final updatedChats = chats.sortChats;
                  return state.copyWith(chats: updatedChats);
                },
              ),
            );
          },
          chatsLoaded: (e) async {
            emit(state.copyWith(loadingStatuses: ChatLoadingStatuses.loading));
            final response = await _chatsRepository.getChats();
            emit(
              response.fold(
                (failure) => failure.map(
                  api: (_) => state.copyWith(
                      loadingStatuses: ChatLoadingStatuses.unexpectedFailure),
                  noConnection: (_) => state.copyWith(
                    loadingStatuses: ChatLoadingStatuses.connectionFailure,
                  ),
                ),
                (chats) {
                  final updatedChats = chats.sortChats;
                  return state.copyWith(
                      chats: updatedChats,
                      loadingStatuses: ChatLoadingStatuses.success);
                },
              ),
            );
          },
          chatDeleted: (e) async {
            final response = await _chatsRepository.deleteChat(e.chatId);
            emit(
              response.fold(
                (l) => state.copyWith(deleteStatus: DeleteStatus.failure),
                (r) => state.copyWith(deleteStatus: DeleteStatus.success),
              ),
            );
          },
          chatsUnsubscribed: (e) async {
            await _subscription!.cancel();
            _subscription = null;
            await _chatsRepository.dispose();
          },
        );
      },
    );
  }
  @override
  Future<void> close() async {
    await _subscription!.cancel();
    await _chatsRepository.dispose();
    return super.close();
  }
}
