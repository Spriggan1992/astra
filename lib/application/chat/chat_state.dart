part of 'chat_bloc.dart';

/// Represent chat states.
@freezed
class ChatState with _$ChatState {
  /// Initial states loaded.
  const factory ChatState.initial() = _Initial;

  /// Progress loading states.
  const factory ChatState.loadInProgress() = _LoadInProgress;

  /// Successfully loaded data state.
  ///
  /// Keep state of [chatMessages] if loaded successfully.
  const factory ChatState.loadSuccess(PaginationChatModel chatMessages) =
      _LoadSuccess;

  /// Unsuccessfully loaded data state.
  const factory ChatState.loadFailure(AstraFailure failure) = _LoadFailure;
}
