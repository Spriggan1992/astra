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

  String get likeInfo => '$amount ${_likeEnding()}';

  /// Return emty like package.
  factory Like.empty() => const Like(
        id: 0,
        amount: 0,
        price: 0,
      );

  /// Get ending of string representation of likes, depend on amount of likes.
  String _likeEnding() {
    if (amount == 1) {
      return "лайк";
    } else if (amount > 1 && amount < 5) {
      return "лайка";
    } else {
      return "лайков";
    }
  }
}
