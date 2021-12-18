part of 'password_bloc.dart';

@freezed
class PasswordEvent with _$PasswordEvent {
  /// Screen initialoization event.
  const factory PasswordEvent.initialized(String phoneNumber, String? code) =
      _Initialized;

  /// Password change event.
  const factory PasswordEvent.changedPassword(String password) =
      _ChangedPassword;

  /// Button click event.
  const factory PasswordEvent.pressedButn() = _PressedButn;
}
