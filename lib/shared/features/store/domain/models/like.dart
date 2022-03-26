import 'package:astra_app/core/domain/extensions/ending_extesion.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'like.freezed.dart';

/// Represent like package.
@freezed
class Like with _$Like {
  const Like._();
  const factory Like({
    /// Like package identifier.
    required int id,

    /// Amount of like packages.
    required int amount,

    /// Like package price.
    required int price,
  }) = _Like;

  /// Get like display name.
  String get likeInfo => '$amount ${amount.likeEnding}';

  /// Return empty like package.
  factory Like.empty() => const Like(
        id: 0,
        amount: 0,
        price: 0,
      );
}
