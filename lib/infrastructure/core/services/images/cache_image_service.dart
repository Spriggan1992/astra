import 'dart:io';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';

import 'i_chache_image_service.dart';

/// Represents service for caching network images.
@LazySingleton(as: ICacheImageService)
class CacheImageService implements ICacheImageService {
  /// Manager for caching images.
  final DefaultCacheManager _defaultCacheManager;

  CacheImageService(
    this._defaultCacheManager,
  );

  @override
  Future<File> getFileImage(String imgUrl) async {
    final compressedImages = await _defaultCacheManager.getSingleFile(imgUrl);
    return compressedImages;
  }
}
