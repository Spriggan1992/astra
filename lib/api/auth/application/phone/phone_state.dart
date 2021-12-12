part of 'phone_bloc.dart';

@freezed
class PhoneState with _$PhoneState {
  const factory PhoneState({
    required String phoneNumber,
    required bool isEnableBtn,
    required bool redirectToPasswordScreen,
    required bool redirectConfirmCode,
  }) = _PhoneState;
  factory PhoneState.initial() => const PhoneState(
        phoneNumber: "",
        isEnableBtn: false,
        redirectToPasswordScreen: false,
        redirectConfirmCode: false,
      );
}
