import 'dart:io';

import 'package:astra_app/core/domain/models/cached_file_image_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part '../../DTOs/cached_file_image.freezed.dart';

/// Defines cached images as file on device.
@freezed
class CachedFileImage with _$CachedFileImage {
  const CachedFileImage._();
  const factory CachedFileImage({
    /// Full image of current user.
    required File fullImage,

    /// Thumbnail image of current user.
    required File thumbnailImage,
  }) = _CachedFileImage;

// Convert DTO to domain.
  CachedFileImageModel toDomain() => CachedFileImageModel(
        fullImage: fullImage,
        thumbnailImage: thumbnailImage,
      );
}
