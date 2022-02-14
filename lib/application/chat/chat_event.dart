part of 'chat_bloc.dart';

/// Describe chat events.
@freezed
class ChatEvent with _$ChatEvent {
  /// Loading chat history event.
  const factory ChatEvent.chatHistoryLoaded(int chatId) = _ChatHistoryLoaded;
}
