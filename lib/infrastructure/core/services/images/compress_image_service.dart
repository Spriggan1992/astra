import 'dart:io';
import 'dart:isolate';

import 'package:astra_app/infrastructure/core/services/images/compressed_images.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:injectable/injectable.dart';

import 'compress_image_path_config.dart';
import 'i_compress_image_service.dart';

/// Represents service for compressing an image.
@LazySingleton(as: ICompressImageService)
class CompressImageService implements ICompressImageService {
  @override
  Future<CompressedImages> compresImageInBackground(
    CompressImagePathsConfig fileConfig,
  ) async {
    final result = await Isolate.spawn(topLevelSpawnEntryPoint, {})
        .then((_) => _compressImage(fileConfig));
    return result;
  }

  Future<CompressedImages> _compressImage(
      CompressImagePathsConfig compressImagePathsConfig) async {
    var compressedImages = const CompressedImages();
    if (compressImagePathsConfig.fullImagePath != null) {
      final fullImage = await FlutterImageCompress.compressAndGetFile(
        compressImagePathsConfig.downloadedImageFile.path,
        compressImagePathsConfig.fullImagePath!,
        quality: 40,
      );
      compressedImages = compressedImages.copyWith(fullImage: fullImage);
    }
    if (compressImagePathsConfig.thumbnailPath != null) {
      final File? thumbnail = await FlutterImageCompress.compressAndGetFile(
        compressImagePathsConfig.downloadedImageFile.path,
        compressImagePathsConfig.thumbnailPath!,
        quality: 40,
        minHeight: 1024,
        minWidth: 768,
      );
      compressedImages = compressedImages.copyWith(thumbnail: thumbnail);
    }
    compressImagePathsConfig.downloadedImageFile.delete();
    return compressedImages;
  }
}

/// This just dummy method for isolates. Cause an isolate spawn method that accepts as an arguments top level function.
/// This means that the function that `Isolate.spawn(...)` method accepts cannot be inside class and must be public.
topLevelSpawnEntryPoint(Map<dynamic, dynamic> message) {}
