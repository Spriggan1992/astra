part of 'repeat_password_bloc.dart';

@freezed
class RepeatPasswordEvent with _$RepeatPasswordEvent {
  const factory RepeatPasswordEvent.initialized(
      String phoneNumber, String confirmePassword) = _Initialized;
  const factory RepeatPasswordEvent.changedPassword(String password) =
      _ChangedPassword;
  const factory RepeatPasswordEvent.submittedPassword(String password) =
      _SubmittedPassword;
  const factory RepeatPasswordEvent.pressedButn() = _PressedButn;
}
