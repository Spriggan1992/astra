// ignore_for_file: invalid_annotation_target

import 'package:astra_app/infrastructure/core/services/images/compressed_images.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';

part 'image_dto.freezed.dart';
part 'image_dto.g.dart';

/// Represet image data transfer object.
@freezed
class ImageDTO with _$ImageDTO {
  const ImageDTO._();
  const factory ImageDTO({
    /// Image identifier.
    @JsonKey(name: 'id') int? id,

    /// Image url.
    @JsonKey(name: 'url') String? imageUrl,

    /// Image bytes for sending to back-end.
    @JsonKey(name: 'images') String? imagePath,
  }) = _ImageDTO;

  /// Return converted DTO from json.
  factory ImageDTO.fromJson(Map<String, dynamic> json) =>
      _$ImageDTOFromJson(json);

  /// Convert object to json.
  factory ImageDTO.toJson() {
    return ImageDTO.toJson();
  }

  /// Return converted DTO from from domain.
  factory ImageDTO.fromDomain(ImageModel _) {
    return ImageDTO(
      imagePath: _.compressedImages!.fullImage!.path,
    );
  }

  /// Convert DTO to domain.
  ImageModel toDomain() => ImageModel(
        id: id,
        imageUrl: "${Endpoints.imageAdress}$imageUrl",
        compressedImages: const CompressedImages(),
      );
}
