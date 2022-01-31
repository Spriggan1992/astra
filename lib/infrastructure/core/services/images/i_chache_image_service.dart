import 'dart:io';

/// Describe service for caching network images.
abstract class ICacheImageService {
  /// Get compressed file images.
  ///
  /// Downloads image from `url` and then return `Future<File>`
  Future<File> getFileImage(String imgUrl);
}
