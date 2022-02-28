import 'dart:async';
import 'dart:developer';

import 'package:astra_app/domain/chats/models/chats_model.dart';
import 'package:astra_app/domain/chats/repositories/i_chats_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'delete_status.dart';

part 'chats_watcher_event.dart';
part 'chats_watcher_state.dart';
part 'chats_watcher_bloc.freezed.dart';

@injectable
class ChatsWatcherBloc extends Bloc<ChatsWatcherEvent, ChatsWatcherState> {
  final IChatsRepository _chatsRepository;
  StreamSubscription? _subscription;
  ChatsWatcherBloc(this._chatsRepository) : super(ChatsWatcherState.initial()) {
    on<ChatsWatcherEvent>(
      (event, emit) async {
        await event.map(
          initialized: (e) async {
            emit(state.copyWith(chats: e.chats));
            add(const ChatsWatcherEvent.watchStarted());
          },
          watchStarted: (e) async {
            _subscription =
                _chatsRepository.subscribeToChatsUpdates().listen((snapshot) {
              log(snapshot.toString(), name: 'chats or failure');
              add(const ChatsWatcherEvent.chatsUpdated());
            });
          },
          chatsUpdated: (e) async {
            final response = await _chatsRepository.getChats();
            response.fold(
              (_) => null,
              (chats) {
                final updatedChats = chats.sorted(
                    (a, b) => b.newMessageCount.compareTo(a.newMessageCount));
                emit(state.copyWith(chats: updatedChats));
              },
            );
          },
          chatDeleted: (e) async {
            final response = await _chatsRepository.deleteChat(e.chatId);
            emit(
              response.fold(
                (l) => state.copyWith(deleteStatus: DeleteStatus.unsuccess),
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
