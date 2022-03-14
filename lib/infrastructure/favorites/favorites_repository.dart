import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/favorites/i_favorites_repository.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:astra_app/infrastructure/profile/DTOs/profile_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:astra_app/domain/profile/models/profile.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Defines the implementation of the api service to Favorites.
@LazySingleton(as: IFavoritesRepository)
class FavoritesRepository implements IFavoritesRepository {
  /// Dio client.
  final Dio _dio;

  FavoritesRepository(this._dio);
  @override
  Future<Either<AstraFailure, List<Profile>>> getLikes() async {
    return await makeRequest<List<Profile>>(() async {
      final response = await _dio.get(Endpoints.feed.getLikes);
      return (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList();
    });
  }

  @override
  Future<Either<AstraFailure, List<Profile>>> getNope() async {
    return await makeRequest<List<Profile>>(() async {
      final response = await _dio.get(Endpoints.feed.getNope);
      return (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList();
    });
  }

  @override
  Future<Either<AstraFailure, List<Profile>>> getThink() async {
    return await makeRequest<List<Profile>>(() async {
      final response = await _dio.get(Endpoints.feed.getThink);
      return (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList();
    });
  }

  @override
  Future<Either<AstraFailure, List<Profile>>> getWhoLikes() async {
    return await makeRequest<List<Profile>>(() async {
      final response = await _dio.get(Endpoints.feed.getWhoLike);
      return (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList();
    });
  }

  @override
  Future<Either<AstraFailure, List<Profile>>> getMatch() async {
    return await makeRequest<List<Profile>>(() async {
      final response = await _dio.get(Endpoints.feed.getMatch);
      return (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList();
    });
  }

  @override
  Future<Either<AstraFailure, Unit>> toThink(int id) async {
    return await makeRequest<Unit>(() async {
      await _dio.post(Endpoints.feed.think(id));
      return unit;
    });
  }

  @override
  Future<Either<AstraFailure, Unit>> removeAllFromStopList() async {
    return await makeRequest<Unit>(() async {
      await _dio.post(Endpoints.feed.allUsersToThink);
      return unit;
    });
  }
}
