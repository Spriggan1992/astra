part of 'repeat_password_bloc.dart';

@freezed
class RepeatPasswordState with _$RepeatPasswordState {
  const factory RepeatPasswordState({
    required String phoneNumber,
    required String confirmePassword,
    required bool isEnableBtn,
    required bool isShowError,
    required bool isSuccessfullySubmitted,
  }) = _RepeatPasswordState;
  factory RepeatPasswordState.initial() => const RepeatPasswordState(
        phoneNumber: '',
        confirmePassword: '',
        isEnableBtn: false,
        isShowError: false,
        isSuccessfullySubmitted: false,
      );
}
