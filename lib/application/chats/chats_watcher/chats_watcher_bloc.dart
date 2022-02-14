import 'dart:async';
import 'dart:developer';

import 'package:astra_app/domain/chats/chats_model.dart';
import 'package:astra_app/domain/chats/i_chats_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chats_watcher_event.dart';
part 'chats_watcher_state.dart';
part 'chats_watcher_bloc.freezed.dart';

@injectable
class ChatsWatcherBloc extends Bloc<ChatsWatcherEvent, ChatsWatcherState> {
  final IChatsRepository _chatRepository;
  StreamSubscription? _subscription;
  ChatsWatcherBloc(this._chatRepository) : super(ChatsWatcherState.initial()) {
    on<ChatsWatcherEvent>(
      (event, emit) async {
        await event.map(
          watchStarted: (e) async {
            _subscription =
                _chatRepository.subscribeToChatsUpdates().listen((snapshot) {
              log(snapshot.toString(), name: 'SNAPSHOT');
            });
          },
        );
      },
    );
  }
  @override
  Future<void> close() async {
    await _subscription!.cancel();
    await _chatRepository.dispose();
    return super.close();
  }
}
