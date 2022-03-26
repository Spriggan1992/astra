part of 'confirm_password_bloc.dart';

@freezed
class ConfirmPasswordEvent with _$ConfirmPasswordEvent {
  /// Screen initialization event.
  const factory ConfirmPasswordEvent.initialized(
      String phoneNumber, String confirmPassword) = _Initialized;

  /// Password change event.
  const factory ConfirmPasswordEvent.changedPassword(String password) =
      _ChangedPassword;

  /// Submit password event.
  const factory ConfirmPasswordEvent.submittedPassword(String password) =
      _SubmittedPassword;

  /// Button click event.
  const factory ConfirmPasswordEvent.pressedButton() = _PressedButton;
}
