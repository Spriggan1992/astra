part of 'chat_watcher_bloc.dart';

@freezed
class ChatWatcherEvent with _$ChatWatcherEvent {
  /// Subscription initialization event.
  const factory ChatWatcherEvent.initialized(
    ChatModel chatModel,
    PaginationChatModel paginationResult,
  ) = _Initialized;

  /// Starts to watch chats updates event.
  const factory ChatWatcherEvent.chatStartedWatch() = _ChatWatched;

  /// Load next messages event.
  const factory ChatWatcherEvent.nextMessagesLoaded() = _NextPageLoaded;

  /// Starts to watch internet status connection event.
  const factory ChatWatcherEvent.internetConnectionStartedWatch() =
      _InternetConnectionWatchedWatched;

  /// Message send event.
  ///
  /// The [message] that is sent to the server
  const factory ChatWatcherEvent.messageSent(String message) = _SendMessage;

  /// Change status internet connection event.
  ///
  /// The [hasConnection] responsible that there has internet connection.
  const factory ChatWatcherEvent.internetConnectionStatusConnectionChanged(
      bool hasConnection) = _SubscribeToInternetConnectionStatus;

  /// Received chat event.
  const factory ChatWatcherEvent.chatReceived(
      SubscriptionMessageModel message) = _ChatReceived;

  /// Received chat event.
  const factory ChatWatcherEvent.chatRead() = _ChatRead;

  /// Received user status online event.
  const factory ChatWatcherEvent.statusOnlineReceived(
      SubscriptionStatusOnlineModel onlineStatus) = _StatusOnlineReceived;
}
