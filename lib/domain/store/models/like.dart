import 'package:astra_app/domain/core/extensions.dart/extension.dart';
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

  /// Return emty like package.
  factory Like.empty() => const Like(
        id: 0,
        amount: 0,
        price: 0,
      );
}
