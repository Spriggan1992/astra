import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'compressed_images.freezed.dart';

/// Represent compressed images.
@freezed
class CompressedImages with _$CompressedImages {
  const CompressedImages._();
  const factory CompressedImages({
    /// Full image.
    File? fullImage,

    /// Thumbnail image.
    File? thumbnail,
  }) = _CompressedImages;
}
