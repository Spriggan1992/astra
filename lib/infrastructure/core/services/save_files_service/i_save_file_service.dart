// import 'dart:io';

// import 'package:astra_app/infrastructure/core/services/images/compressed_images.dart';

// /// Desribe service for saving files to device.
// abstract class ISaveFileService {
//   /// Get full quality image(1920x1080) that stored in local file from temporary directory.
//   ///
//   /// Get as an argument `fileNamePath`. File will be stored to `path/fileNamePath`
//   Future<File> getFullImageFromTemporaryDirectory(String fileNamePath);

//   /// Get thumbnail image (1024x768) that stored in local file from temporary directory.
//   ///
//   /// Get as an argument `fileNamePath`. File will be stored to `path/fileNamePath.thumbnail.jpeg`
//   Future<File> getThumbnailImageFromTemporaryDirectory(String fileNamePath);

//   /// Get temparary local file from temporary directory.
//   ///
//   /// Get as an argument `fileNamePath`. File will be stored to `path/fileNamePathtemp`
//   Future<File> getDownloadedTempImageFileFromTemporaryDirectory(
//       String fileNamePath);

//   /// Read file from temporary directory.
//   Future<File?> readFileFromTempararyDirectory(String fileNamePath);
// }
