part of 'phone_bloc.dart';

@freezed
class PhoneState with _$PhoneState {
  const factory PhoneState({
    /// Input phone number.
    required String phoneNumber,

    /// A flag that responsible for enable/disable button.
    required bool isEnableBtn,

    /// A flag that responsible for redirect to [PasswordScreen].
    required bool redirectToPasswordScreen,

    /// A flag that responsible for redirect to [CodeScreen].
    required bool redirectConfirmCode,
  }) = _PhoneState;
  factory PhoneState.initial() => const PhoneState(
        phoneNumber: "",
        isEnableBtn: false,
        redirectToPasswordScreen: false,
        redirectConfirmCode: false,
      );
}
