import 'package:astra_app/domain/profile/models/profile.dart';


import '../../core/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to list of applicants.
abstract class ISearchRepository {
  /// Gets list of applicants
  Future<Either<AstraFailure, List<Profile>>> getApplicants();

   /// To like user.
  Future<Either<AstraFailure, Unit>> toLike(int id);

  /// To think about user.
  Future<Either<AstraFailure, Unit>> toThink(int id);

  /// To reject user.
  Future<Either<AstraFailure, Unit>> toReject(int id);

  /// To block user.
  Future<Either<AstraFailure, Unit>> toBlock(int id);
}
