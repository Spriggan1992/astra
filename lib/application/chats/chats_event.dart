part of 'chats_bloc.dart';

/// Represent event for list of chats.
@freezed
class ChatsEvent with _$ChatsEvent {
  /// Loading chats event.
  const factory ChatsEvent.chatsLoaded() = _ChatsLoaded;
}
