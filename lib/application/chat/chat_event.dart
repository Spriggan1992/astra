part of 'chat_bloc.dart';

/// Describe chat events.
@freezed
class ChatEvent with _$ChatEvent {
  /// Loading chat history event.
  const factory ChatEvent.chatHistoryLoaded(int chatId) = _ChatHistoryLoaded;

  /// Connect to chat event.
  const factory ChatEvent.connectToChat(int chatId) = _ConnectToChat;

  /// Subscription to internet connection event.
  const factory ChatEvent.internetConnectionStatusSubscribed(
      bool hasConnection) = _SubscribeToInternetConnectionStatus;

  /// Recived chat event.
  const factory ChatEvent.chatRecived(
      Either<AstraFailure, MessageModel> messageOrFailure) = _ChatRecived;

  /// Send message event.
  const factory ChatEvent.sendMessage(String message) = _SendMessage;
}
