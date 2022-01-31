import 'package:astra_app/domain/core/models/image_models.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/services/images/i_chache_image_service.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:astra_app/infrastructure/profile/DTOs/profile_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/search/repositories/i_search_repository.dart';
import 'package:injectable/injectable.dart';

/// Defines the implementation of the api service to list of applicants.
@LazySingleton(as: ISearchRepository)
class SearchRepository extends ISearchRepository {
  ///Dio client
  final Dio _dio;

  /// Service for caching network images.
  final ICacheImageService _cacheImageService;

  SearchRepository(this._dio, this._cacheImageService);

  @override
  Future<Either<AstraFailure, List<Profile>>> getApplicants() async {
    final result = await makeRequest<List<Profile>>(() async {
      List<Profile> _profiles = [];
      final response = await _dio.get(Endpoints.user.feed);
      for (var item in response.data) {
        final profile = ProfileDTO.fromJson(item).toDomain();
        final imageModels = await _getImageModels(profile.profilePhotos);
        final updatedProfile = profile.copyWith(profilePhotos: imageModels);
        _profiles.add(updatedProfile);
      }
      return _profiles;
    });
    return result.fold((l) => left(l), (r) => right(r));
  }

  Future<List<ImageModel>> _getImageModels(List<ImageModel> value) async {
    List<ImageModel> images = [];
    for (var e in value) {
      final compressedImages =
          await _cacheImageService.getCompressedFileImage(e.imageUrl);
      images.add(ImageModel(
          imageUrl: e.imageUrl, id: e.id, compressedImages: compressedImages));
    }
    return images;
  }

  @override
  Future<Either<AstraFailure, Unit>> toLike(int id) async {
    final result = await makeRequest<Unit>(() async {
      await _dio.post(Endpoints.feed.like(id));
      return unit;
    });
    return result.fold((failure) => left(failure), (_) => right(_));
  }

  @override
  Future<Either<AstraFailure, Unit>> toBlock(int id) async {
    final result = await makeRequest<Unit>(() async {
      await _dio.post(Endpoints.feed.block(id));
    });
    return result.fold((failure) => left(failure), (_) => right(_));
  }

  @override
  Future<Either<AstraFailure, Unit>> toReject(int id) async {
    final result = await makeRequest<Unit>(() async {
      await _dio.post(Endpoints.feed.nope(id));
    });

    return result.fold((failure) => left(failure), (_) => right(_));
  }

  @override
  Future<Either<AstraFailure, Unit>> toThink(int id) async {
    final result = await makeRequest<Unit>(() async {
      await _dio.post(Endpoints.feed.think(id));
      return unit;
    });
    return result.fold((failure) => left(failure), (_) => right(_));
  }
}
