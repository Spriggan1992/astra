part of 'password_bloc.dart';

@freezed
class PasswordState with _$PasswordState {
  const factory PasswordState({
    /// Input phone number.
    required String phoneNumber,

    /// Input password
    required String password,

    /// A flag that responsible for enable/disable button.
    required bool isEnableBtn,

    /// A flag that responsible for displaying error message.
    required bool isShowError,

    /// A flag responsible for condition if user already was signed in system or not.
    required bool isSignIn,

    /// Authorization information.
    required AuthInfo authInfo,

    /// A flag that responsible that user successfully signed in.
    required bool isSuseccfullySignIn,

    /// A flag that responsible for redirect to [ConfirmPasswordScreen].
    required bool redirectToConfirmePassword,

    /// Sms code.
    ///
    /// Can be [null], if the user already had been registered before.
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
