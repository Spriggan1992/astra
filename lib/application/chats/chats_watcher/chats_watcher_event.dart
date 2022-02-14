part of 'chats_watcher_bloc.dart';

@freezed
class ChatsWatcherEvent with _$ChatsWatcherEvent {
  /// Starts to watch chats updates event.
  const factory ChatsWatcherEvent.watchStarted() = _WatchStarted;
}
