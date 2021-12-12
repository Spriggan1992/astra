part of 'password_bloc.dart';

@freezed
class PasswordState with _$PasswordState {
  const factory PasswordState({
    required String phoneNumber,
    required String password,
    required bool isEnableBtn,
    required bool isShowError,
    required bool isSignIn,
    required AuthInfo authInfo,
    required bool isSuseccfullySignIn,
    required bool redirectToConfirmePassword,
    String? code,
  }) = _PasswordState;
  factory PasswordState.initial() => PasswordState(
        phoneNumber: '',
        password: '',
        isEnableBtn: false,
        isShowError: false,
        isSignIn: false,
        authInfo: AuthInfo.empty(),
        isSuseccfullySignIn: false,
        redirectToConfirmePassword: false,
      );
}
