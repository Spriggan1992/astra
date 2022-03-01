part of 'chats_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  const factory ChatsState({
    /// List of chat models.
    required List<ChatModel> chats,
    required ChatLoadingStatuses loadingStatuses,

    /// Status of deleting chat.
    required DeleteStatus deleteStatus,
  }) = _ChatsWatcherState;

  /// Initial state when bloc will be initialized.
  factory ChatsState.initial() => const ChatsState(
        chats: [],
        deleteStatus: DeleteStatus.initial,
        loadingStatuses: ChatLoadingStatuses.initial,
      );
}
