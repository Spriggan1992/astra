import 'package:astra_app/domain/profile/models/profile_properties.dart';
import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/profile/repositories/i_profile_properties_repository.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/utils/make_request.dart';
import 'package:astra_app/infrastructure/profile/DTOs/profile_properties_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProfilePropertiesRepository)

/// Profile additional info api.
class ProfilePropertiesRepository implements IProfilePropertiesRepository {
  ProfilePropertiesRepository(this._dio);

  /// Dio client.
  final Dio _dio;

  @override
  Future<Either<AstraFailure, List<ProfileProperties>>> getProfileProperties(
      int id) async {
    return await makeRequest<List<ProfileProperties>>(() async {
      final response = await _dio.get(Endpoints.user.properties(id));
      final profileProperties =
          ProfilePropertiesDTO.fromJson(response.data["data"]).toDomain();
      return profileProperties;
    });
  }
}
