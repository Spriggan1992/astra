part of 'password_bloc.dart';

@freezed
class PasswordEvent with _$PasswordEvent {
  const factory PasswordEvent.initialized(String phoneNumber, String? code) =
      _Initialized;
  const factory PasswordEvent.changedPassword(String password) =
      _ChangedPassword;
  const factory PasswordEvent.submittedPassword(String password) =
      _SubmittedPassword;
  const factory PasswordEvent.pressedButn() = _PressedButn;
}
