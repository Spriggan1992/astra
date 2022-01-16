import 'package:astra_app/infrastructure/core/services/images/compress_image_path_config.dart';
import 'package:astra_app/infrastructure/core/services/save_files_service/i_save_file_service.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'compressed_images.dart';
import 'i_chache_image_service.dart';
import 'i_compress_image_service.dart';

/// Represents service for caching network images.
@LazySingleton(as: ICacheImageService)
class CacheImageService implements ICacheImageService {
  /// Dio client.
  final Dio _dio;

  /// Service for seving files to device.
  final ISaveFileService _saveFileService;

  /// Service for compress images.
  final ICompressImageService _compressImage;

  CacheImageService(
    this._dio,
    this._saveFileService,
    this._compressImage,
  );

  @override
  Future<CompressedImages> getCompressedFileImage(String imgUrl,
      {bool isFullImage = true, bool isThumbnail = true}) async {
    final CompressedImages? compressedImages =
        await _saveFileService.readFileFromTempararyDirectory(imgUrl);
    if (compressedImages != null) {
      return compressedImages;
    } else {
      final downloadFile =
          await _downloadFile(imgUrl, isFullImage, isThumbnail);
      final compressedImages =
          await _compressImage.compresImageInBackground(downloadFile);
      return compressedImages;
    }
  }

  Future<CompressImagePathsConfig> _downloadFile(
      String imgUrl, bool isFullImage, bool isThumbnail) async {
    final compressImagePathsConfig =
        await _setUpCompressImagePathsConfig(imgUrl, isFullImage, isThumbnail);
    await _dio.download(
        imgUrl, compressImagePathsConfig.downloadedImageFile.path);
    return compressImagePathsConfig;
  }

  Future<CompressImagePathsConfig> _setUpCompressImagePathsConfig(
    String imgUrl,
    bool isFullImage,
    bool isThumbnail,
  ) async {
    final downloadedImageFile = await _saveFileService
        .getDownloadedTempImageFileFromTemporaryDirectory(imgUrl);
    var config =
        CompressImagePathsConfig(downloadedImageFile: downloadedImageFile);
    if (isFullImage) {
      final fullImagePath = await _saveFileService
          .getFullImageFromTemporaryDirectory(imgUrl)
          .then((value) => value.path);
      config = config.copyWith(fullImagePath: fullImagePath);
    }
    if (isThumbnail) {
      final thumbnailPath = await _saveFileService
          .getThumbnailImageFromTemporaryDirectory(imgUrl)
          .then((value) => value.path);
      config = config.copyWith(thumbnailPath: thumbnailPath);
    }
    return config;
  }
}
