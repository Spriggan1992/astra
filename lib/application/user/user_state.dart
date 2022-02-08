part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    /// Flag responsible for showing error dialog when unexpected error happend.
    required bool isUnexpectedError,
  }) = _UserState;
  factory UserState.initial() => const UserState(
        isUnexpectedError: false,
      );
}
