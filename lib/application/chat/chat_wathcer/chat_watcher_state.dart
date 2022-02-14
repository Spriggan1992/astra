part of 'chat_watcher_bloc.dart';

@freezed
class ChatWatcherState with _$ChatWatcherState {
  const factory ChatWatcherState({
    /// Loading states.
    required LoadingStates loadingStates,

    /// Chat messages.
    required List<MessageModel> chatMessages,

    /// Chat id.
    required int chatId,

    /// Flag responsible internet connection state.
    required bool hasConnection,
  }) = _ChatWatcherState;
  factory ChatWatcherState.initila() => const ChatWatcherState(
        loadingStates: LoadingStates.initial,
        chatMessages: [],
        chatId: 0,
        hasConnection: true,
      );
}
