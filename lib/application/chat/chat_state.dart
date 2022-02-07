part of 'chat_bloc.dart';

/// Represent chat states.
@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    /// Loading states.
    required LoadingStates loadingStates,

    /// Chat messages.
    required List<MessageModel> chatMessages,

    /// Flag responsible internet connection state.
    required bool hasConnection,
  }) = _ChatState;

  /// Initial constructor of [ChatState].
  factory ChatState.initial() => const ChatState(
        loadingStates: LoadingStates.initial,
        chatMessages: [],
        hasConnection: true,
      );
}
