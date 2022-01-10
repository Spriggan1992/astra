import 'compressed_images.dart';

/// Describe service for caching network images.
abstract class ICacheImageService {
  /// Get compressed file images.
  ///
  /// Downloads image from `url` and then return `Future<CompressedImages>`
  /// that stored compressed images. If `isFullImage` is false, then
  /// return [CompressedImages] without full image. If `isThumbnail`is false, then
  /// return [CompressedImages] without thumbnail image
  Future<CompressedImages> getCompressedFileImage(String imgUrl,
      {bool isFullImage, bool isThumbnail});
}
