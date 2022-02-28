part of 'chats_watcher_bloc.dart';

@freezed
class ChatsWatcherEvent with _$ChatsWatcherEvent {
  /// Initialized chats event.
  const factory ChatsWatcherEvent.initialized(List<ChatModel> chats) =
      _Initialized;

  /// Starts to watch chats updates event.
  const factory ChatsWatcherEvent.watchStarted() = _WatchStarted;

  /// Chats updated event.
  const factory ChatsWatcherEvent.chatsUpdated() = _ChatsUpdated;

  /// Chats delete event.
  const factory ChatsWatcherEvent.chatDeleted(int chatId) = _ChatDeleted;

  /// Chats unsubscribed event.
  const factory ChatsWatcherEvent.chatsUnsubscribed() = _ChatsUnsubscribed;
}
