import 'dart:io';
import 'package:astra_app/infrastructure/core/services/images/compressed_images.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'i_save_file_service.dart';

/// Service for saving files to device.
@LazySingleton(as: ISaveFileService)
class SaveFileService implements ISaveFileService {
  @override
  Future<File> getFullImageFromTemporaryDirectory(String fileNamePath) async {
    final path = await _temporaryDirectory();
    return File('$path/$fileNamePath');
  }

  @override
  Future<File> getThumbnailImageFromTemporaryDirectory(
      String fileNamePath) async {
    final path = await _temporaryDirectory();
    return File('$path/${fileNamePath}thumbnail.jpeg');
  }

  @override
  Future<File> getDownloadedTempImageFileFromTemporaryDirectory(
      String fileNamePath) async {
    final path = await _temporaryDirectory();
    return File('$path/$fileNamePath + temp');
  }

  @override
  Future<CompressedImages?> readFileFromTempararyDirectory(
      String fileNamePath) async {
    final directory = await getFullImageFromTemporaryDirectory(fileNamePath);
    bool isFileExist = directory.existsSync();
    if (isFileExist) {
      final fullImage = await getFullImageFromTemporaryDirectory(fileNamePath);
      final thumbNail =
          await getThumbnailImageFromTemporaryDirectory(fileNamePath);
      final compressedImages =
          CompressedImages(fullImage: fullImage, thumbnail: thumbNail);
      return compressedImages;
    } else {
      return null;
    }
  }

  Future<String> _temporaryDirectory() async {
    final directory = await path.getTemporaryDirectory();
    return directory.path;
  }
}
