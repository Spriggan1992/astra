import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/infrastructure/http/api_client.dart';
import 'package:astra_app/core/infrastructure/http/endpoints.dart';
import 'package:astra_app/favorites/domain/i_favorites_repository.dart';
import 'package:astra_app/settings/domain/profile/models/profile_model.dart';
import 'package:astra_app/settings/infrastructure/profile/DTOs/profile_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// Defines the implementation of the api service to Favorites.
@LazySingleton(as: IFavoritesRepository)
class FavoritesRepository implements IFavoritesRepository {
  /// Api client for making request.
  final ApiClient _apiClient;

  FavoritesRepository(this._apiClient);
  @override
  Future<Either<AstraFailure, List<ProfileModel>>> getLikes() async {
    return _apiClient.get(
      Endpoints.feed.getLikes,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList(),
    );
  }

  @override
  Future<Either<AstraFailure, List<ProfileModel>>> getNope() async {
    return _apiClient.get(
      Endpoints.feed.getNope,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList(),
    );
  }

  @override
  Future<Either<AstraFailure, List<ProfileModel>>> getThink() async {
    return _apiClient.get(
      Endpoints.feed.getThink,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList(),
    );
  }

  @override
  Future<Either<AstraFailure, List<ProfileModel>>> getWhoLikes() async {
    return _apiClient.get(
      Endpoints.feed.getWhoLike,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList(),
    );
  }

  @override
  Future<Either<AstraFailure, List<ProfileModel>>> getMatch() async {
    return _apiClient.get(
      Endpoints.feed.getMatch,
      responseParser: (response) => (response.data as List<dynamic>)
          .map((e) => ProfileDTO.fromJson(e).toDomain())
          .toList(),
    );
  }

  @override
  Future<Either<AstraFailure, Unit>> toThink(int id) async {
    return _apiClient.post(Endpoints.feed.think(id),
        responseParser: (_) => unit);
  }

  @override
  Future<Either<AstraFailure, Unit>> removeAllFromStopList() async {
    return _apiClient.post(Endpoints.feed.allUsersToThink,
        responseParser: (_) => unit);
  }
}
