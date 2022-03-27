import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/domain/models/profile_model.dart';
import 'package:astra_app/core/infrastructure/DTOs/profile_dto.dart';
import 'package:astra_app/core/infrastructure/http/api_client.dart';
import 'package:astra_app/core/infrastructure/http/endpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:astra_app/search/search/domain/i_search_repository.dart';
import 'package:injectable/injectable.dart';

/// Defines the implementation of the api service to list of applicants.
@LazySingleton(as: ISearchRepository)
class SearchRepository extends ISearchRepository {
  /// Api client for making request.
  final ApiClient _apiClient;

  SearchRepository(this._apiClient);

  @override
  Future<Either<AstraFailure, List<ProfileModel>>> getApplicants() async {
    return _apiClient.get(Endpoints.user.feed,
        responseParser: (response) => (response.data as List<dynamic>)
            .map((e) =>
                ProfileDTO.fromJson(e as Map<String, dynamic>).toDomain())
            .toList());
  }

  @override
  Future<Either<AstraFailure, bool>> showAccount() async {
    return _apiClient.post(
      Endpoints.user.showAccount,
      responseParser: (response) => response.statusCode == 200,
    );
  }

  @override
  Future<Either<AstraFailure, Unit>> toLike(int id) async {
    return _apiClient.post(Endpoints.feed.like(id),
        responseParser: (response) => unit);
  }

  @override
  Future<Either<AstraFailure, Unit>> toBlock(int id) async {
    return _apiClient.post(Endpoints.feed.block(id),
        responseParser: (response) => unit);
  }

  @override
  Future<Either<AstraFailure, Unit>> toReject(int id) async {
    return _apiClient.post(Endpoints.feed.nope(id),
        responseParser: (response) => unit);
  }

  @override
  Future<Either<AstraFailure, Unit>> toThink(int id) async {
    return _apiClient.post(Endpoints.feed.think(id),
        responseParser: (response) => unit);
  }
}
