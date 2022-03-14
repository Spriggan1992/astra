part of 'chats_bloc.dart';

@freezed
class ChatsEvent with _$ChatsEvent {
  /// Initialized chats event.
  const factory ChatsEvent.initialized() = _Initialized;

  /// Chats loaded event.
  const factory ChatsEvent.chatsLoaded() = _ChatsLoaded;

  /// Starts to watch chats updates event.
  const factory ChatsEvent.watchStarted() = _WatchStarted;

  /// Chats updated event.
  const factory ChatsEvent.chatsUpdated() = _ChatsUpdated;

  /// Chats delete event.
  const factory ChatsEvent.chatDeleted(int chatId) = _ChatDeleted;

  /// Chats unsubscribed event.
  const factory ChatsEvent.chatsUnsubscribed() = _ChatsUnsubscribed;

  /// Chat created event.

  const factory ChatsEvent.createChat(int userId) = _CreateChat;

  /// Chat opened event.
  const factory ChatsEvent.chatOpened(int userId) = _ChatOpened;

  ///Chat existence check event
  ///
  /// The [userId] user identifier.
  const factory ChatsEvent.existenceChatChecked(int userId) =
      _ExistenceChatChecked;
}
