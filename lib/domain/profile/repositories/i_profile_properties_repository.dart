import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:astra_app/domain/profile/models/profile_properties.dart';
import 'package:dartz/dartz.dart';

/// Describe profile properties api.
abstract class IProfilePropertiesRepository {
  /// Load profile additional information
  Future<Either<AstraFailure, List<ProfileProperties>>> getProfileProperties(
      int id);
}
