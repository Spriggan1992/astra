import 'compress_image_path_config.dart';
import 'compressed_images.dart';

/// Describe service for compressing an image.
abstract class ICompressImageService {
  /// Compress the image in isolate in background.'
  ///
  /// Get file from `fileConfig.downloadedImageFile`,
  /// compress it and then save it to the `fileConfig.targetPath`.
  Future<CompressedImages> compresImageInBackground(
      CompressImagePathsConfig fileConfig);
}
