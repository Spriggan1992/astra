part of 'chat_bloc.dart';

/// Represent chat states.
@freezed
class ChatState with _$ChatState {
  /// Initial states loaded.
  const factory ChatState.initial() = _Initial;

  /// Progress loading states.
  const factory ChatState.loadInProgress() = _LoadInProgress;

  /// Successfule loaded data state.
  ///
  /// Keep state of [chatMessages] if loaded successfully.
  const factory ChatState.loadSuccess(List<MessageModel> chatMessages) =
      _LoadSuccess;

  /// Unsuccessfully loaded data state.
  const factory ChatState.loadFailure(AstraFailure failure) = _LoadFailure;
}
