import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astra_app/core/domain/extensions/ending_extesion.dart';
part 'promocode_model.freezed.dart';

/// Represent information about promocode.
@freezed
class PromocodeModel with _$PromocodeModel {
  const PromocodeModel._();
  const factory PromocodeModel({
    /// Promocode.
    String? code,

    /// Amount of likes.
    int? likesAmount,
  }) = _PromocodeModel;

  /// Empty promocode.
  factory PromocodeModel.empty() => const PromocodeModel(
        likesAmount: 0,
      );

  /// Gets likes from promo code that will be put on account.
  String get getLikes => '$likesAmount ${likesAmount?.likeEnding ?? 0}';
}
