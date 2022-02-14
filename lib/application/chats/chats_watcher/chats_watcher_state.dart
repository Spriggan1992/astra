part of 'chats_watcher_bloc.dart';

@freezed
class ChatsWatcherState with _$ChatsWatcherState {
  const factory ChatsWatcherState({
    /// List of chat models.
    required List<ChatModel> chats,
  }) = _ChatsWatcherState;
  factory ChatsWatcherState.initial() => const ChatsWatcherState(
        chats: [],
      );
}
