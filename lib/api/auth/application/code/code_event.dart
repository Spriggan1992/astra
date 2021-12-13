part of 'code_bloc.dart';

@freezed
class CodeEvent with _$CodeEvent {
  const factory CodeEvent.initialized(String phoneNumber) = _Initialized;
  const factory CodeEvent.changeCodeValue(String code) = _ChangeCodeValue;
  const factory CodeEvent.onSubmitCode(String code) = _OnSubmitCode;
}
