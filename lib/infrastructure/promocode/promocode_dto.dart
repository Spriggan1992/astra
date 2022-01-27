import 'package:astra_app/domain/promocode/promocode_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'promocode_dto.freezed.dart';
part 'promocode_dto.g.dart';

/// Represent promocode data transfer object.
@freezed
class PromocodeDTO with _$PromocodeDTO {
  const PromocodeDTO._();
  const factory PromocodeDTO({
    required bool isActivated,
    required String code,
    required int likes,
  }) = _PromocodeDTO;
  // Convert DTO from domain.
  factory PromocodeDTO.fromDomain(PromocodeModel _) {
    return PromocodeDTO(
      code: _.code,
      isActivated: _.isActivated,
      likes: _.likes,
    );
  }

// Convert DTO to domain.
  PromocodeModel toDomain() => PromocodeModel(
        code: code,
        isActivated: isActivated,
        likes: likes,
      );
// Return converted DTO from json.
  factory PromocodeDTO.fromJson(Map<String, dynamic> json) =>
      _$PromocodeDTOFromJson(json);

// Convert object to json.
  factory PromocodeDTO.toJson() {
    return PromocodeDTO.toJson();
  }
}
