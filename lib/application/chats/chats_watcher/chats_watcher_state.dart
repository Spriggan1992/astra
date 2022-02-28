part of 'chats_watcher_bloc.dart';

@freezed
class ChatsWatcherState with _$ChatsWatcherState {
  const factory ChatsWatcherState({
    /// List of chat models.
    required List<ChatModel> chats,

    /// Status of deleting chat.
    required DeleteStatus deleteStatus,
  }) = _ChatsWatcherState;

  /// Initial state when bloc will be initialized.
  factory ChatsWatcherState.initial() => const ChatsWatcherState(
        chats: [],
        deleteStatus: DeleteStatus.initial,
      );
}
