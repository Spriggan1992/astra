part of 'promocode_bloc.dart';

@freezed
class PromocodeEvent with _$PromocodeEvent {
  /// Promo code submitting event.
  const factory PromocodeEvent.codeSubmitted() = _CodeSubmitted;

  /// Promo code changing event.
  ///
  /// Get `promocode` from text field.
  const factory PromocodeEvent.promocodeChanged(String promocode) =
      _PromocodeChanged;
}
