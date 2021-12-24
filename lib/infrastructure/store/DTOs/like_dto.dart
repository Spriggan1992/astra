import 'package:astra_app/domain/store/models/like.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'like_dto.freezed.dart';
part 'like_dto.g.dart';

/// Represent like package data transfer object.
@freezed
class LikeDTO with _$LikeDTO {
  const LikeDTO._();
  const factory LikeDTO({
    /// Like package identifier.
    required int id,

    /// Amount of like packages.
    required int amount,

    /// Like package price.
    required int price,
  }) = _LikeDTO;

  /// Return converted DTO from json.
  factory LikeDTO.fromJson(Map<String, dynamic> json) =>
      _$LikeDTOFromJson(json);

  /// Convert object to json.
  factory LikeDTO.toJson() {
    return LikeDTO.toJson();
  }

  /// Return converted DTO from from domain.
  factory LikeDTO.fromDomain(Like _) {
    return LikeDTO(
      id: _.id,
      amount: _.amount,
      price: _.price,
    );
  }

  /// Convert DTO to domain.
  Like toDomain() => Like(
        id: id,
        amount: amount,
        price: price,
      );
}
