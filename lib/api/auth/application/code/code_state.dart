part of 'code_bloc.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState({
    required String phoneNumber,
    required String code,
    required String validatedCode,
    required bool isShowErrorMessage,
    required bool isEnableBtn,
    required bool isValid,
  }) = _CodeState;
  factory CodeState.initial() => const CodeState(
        code: '',
        phoneNumber: '',
        validatedCode: "1234",
        isShowErrorMessage: false,
        isEnableBtn: false,
        isValid: false,
      );
}
