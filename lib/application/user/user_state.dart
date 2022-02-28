part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    /// Flag responsible for showing error dialog when unexpected error happened.
    required bool isUnexpectedError,
    required bool isOnline,
  }) = _UserState;

  /// Initial state when bloc will be initialized.
  factory UserState.initial() => const UserState(
        isUnexpectedError: false,
        isOnline: false,
      );
}
