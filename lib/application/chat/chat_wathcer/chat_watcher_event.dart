part of 'chat_watcher_bloc.dart';

@freezed
class ChatWatcherEvent with _$ChatWatcherEvent {
  /// Subscription initialoization event.
  const factory ChatWatcherEvent.initialized(
      int chatId, List<MessageModel> messages) = _Initialized;

  /// Starts to watch chats updates event.
  const factory ChatWatcherEvent.chatStartedWatch() = _ChatWatched;

  /// Start to watch internet status connection event.
  const factory ChatWatcherEvent.internetConnectionStartedWatch() =
      _InternetConnectionWatchedWatched;

  /// Message send event.
  ///
  /// The [message] that is sent to the server
  const factory ChatWatcherEvent.messageSent(String message) = _SendMessage;

  /// Change status internet connection event.
  ///
  /// The [hasConnection] responsable that there has internet connection.
  const factory ChatWatcherEvent.internetConnectionStatusConnectionChanged(
      bool hasConnection) = _SubscribeToInternetConnectionStatus;

  /// Recived chat event.
  ///
  /// The [messageOrFailure] contains `SubscriptionModel` requiest was success, or `AstraFailure` if failure.
  const factory ChatWatcherEvent.chatRecived(
      Either<AstraFailure, SubscriptionModel<MessageModel>>
          messageOrFailure) = _ChatRecived;
}
