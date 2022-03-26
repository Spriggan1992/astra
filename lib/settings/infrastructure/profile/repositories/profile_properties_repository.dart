import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/infrastructure/http/api_client.dart';
import 'package:astra_app/core/infrastructure/http/endpoints.dart';
import 'package:astra_app/settings/domain/profile/models/profile_properties.dart';
import 'package:astra_app/settings/domain/profile/repositories/i_profile_properties_repository.dart';
import 'package:astra_app/settings/infrastructure/profile/DTOs/profile_properties_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProfilePropertiesRepository)

/// Profile additional info api.
class ProfilePropertiesRepository implements IProfilePropertiesRepository {
  /// Api client for making request.
  final ApiClient _apiClient;

  ProfilePropertiesRepository(this._apiClient);

  @override
  Future<Either<AstraFailure, List<ProfileProperties>>> getProfileProperties(
      int id) async {
    return _apiClient.get(
      Endpoints.user.properties(id),
      responseParser: (response) =>
          ProfilePropertiesDTO.fromJson(response.data["data"]).toDomain(),
    );
  }
}
