part of 'chats_bloc.dart';

@freezed
class ChatsState with _$ChatsState {
  /// Initial states loaded.
  const factory ChatsState.initial() = _Initial;

  /// Progress loading states.
  const factory ChatsState.loadInProgress() = LoadInProgress;

  /// Successfully loaded data state.
  ///
  /// Keep state of [chats] if loaded successfully.
  const factory ChatsState.loadSuccess(List<ChatModel> chats) = LoadSuccess;

  /// Unsuccessfully loaded data state.
  const factory ChatsState.loadFailure(AstraFailure failure) = _LoadFailure;
}
