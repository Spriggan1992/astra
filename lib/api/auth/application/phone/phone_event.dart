part of 'phone_bloc.dart';

@freezed
class PhoneEvent with _$PhoneEvent {
  const factory PhoneEvent.initialized() = _Initialized;
  const factory PhoneEvent.changedTextValue(String value) = _ChangedTextValue;
  const factory PhoneEvent.pressedBtn() = _PressedBtn;
  const factory PhoneEvent.resetStates() = _ResetStates;
}
