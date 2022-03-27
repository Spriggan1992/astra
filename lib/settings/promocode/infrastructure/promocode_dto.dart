// ignore_for_file: invalid_annotation_target

import 'package:astra_app/settings/promocode/domain/promocode_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'promocode_dto.freezed.dart';
part 'promocode_dto.g.dart';

/// Represent promocode data transfer object.
@freezed
class PromocodeDTO with _$PromocodeDTO {
  const PromocodeDTO._();
  const factory PromocodeDTO({
    /// Promocode.
    @JsonKey(name: 'promocode') String? code,

    /// Amount of likes.
    @JsonKey(name: 'likes_amount') int? likesAmount,
  }) = _PromocodeDTO;

  // Convert DTO from domain.
  factory PromocodeDTO.fromDomain(PromocodeModel _) {
    return PromocodeDTO(
      code: _.code!,
    );
  }

// Convert DTO to domain.
  PromocodeModel toDomain() => PromocodeModel(
        likesAmount: likesAmount ?? 0,
      );
// Return converted DTO from json.
  factory PromocodeDTO.fromJson(Map<String, dynamic> json) =>
      _$PromocodeDTOFromJson(json);

// Convert object to json.
  factory PromocodeDTO.toJson() {
    return PromocodeDTO.toJson();
  }
}
