import 'package:astra_app/domain/core/extensions/ending_extesion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'promocode_model.freezed.dart';

/// Represent information about promocode.
@freezed
class PromocodeModel with _$PromocodeModel {
  const PromocodeModel._();
  const factory PromocodeModel({
    required bool isActivated,
    required String code,
    required int likes,
  }) = _PromocodeModel;

  /// Empty promocode.
  factory PromocodeModel.empty() => const PromocodeModel(
        isActivated: false,
        code: '',
        likes: 0,
      );

  /// Gets likes from promo code that will be put on account.
  String get getLikes => '$likes ${likes.likeEnding}';
}
