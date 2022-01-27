part of 'promocode_bloc.dart';

@freezed
class PromocodeState with _$PromocodeState {
  const factory PromocodeState({
    /// The state of loading data.
    required bool isLoading,

    /// The state of showing error if no internet connection.
    required bool isNoConnectionError,

    /// The state of showing error if ocure unexpected error.
    required bool isUnexpectedError,

    /// The state of successfully loaded promocode.
    required bool isSuccess,

    /// The state of validating text input value.
    required bool textInputIsVaslid,

    /// The state of validating promocode.
    required bool isNotValid,

    /// The state of validating promocode when it doen't exist.
    required bool isNotExist,

    /// The state of promocode information.
    required PromocodeModel promocodeModel,

    /// Promo code received from the text field
    required String promocode,
  }) = _PromocodeState;

  /// Initial state.
  factory PromocodeState.initial() => PromocodeState(
        isLoading: false,
        isNoConnectionError: false,
        isUnexpectedError: false,
        isSuccess: false,
        textInputIsVaslid: false,
        isNotValid: false,
        isNotExist: false,
        promocodeModel: PromocodeModel.empty(),
        promocode: '',
      );
}
