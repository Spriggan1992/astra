// ignore_for_file: invalid_internal_annotation
import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'compress_image_path_config.freezed.dart';

/// Represent configuration for compressing image.
@freezed
class CompressImagePathsConfig with _$CompressImagePathsConfig {
  const CompressImagePathsConfig._();
  const factory CompressImagePathsConfig({
    /// File where image will be downloaded.
    required File downloadedImageFile,

    /// Path where full image will be stored.
    String? fullImagePath,

    /// Path where thumbnail image will be stored.
    String? thumbnailPath,
  }) = _CompressImagePathsConfig;
}
