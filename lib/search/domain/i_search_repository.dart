import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/settings/domain/profile/models/profile_model.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to list of applicants.
abstract class ISearchRepository {
  /// Gets list of applicants
  Future<Either<AstraFailure, List<ProfileModel>>> getApplicants();

  /// To like user.
  Future<Either<AstraFailure, Unit>> toLike(int id);

  /// To think about user.
  Future<Either<AstraFailure, Unit>> toThink(int id);

  /// To reject user.
  Future<Either<AstraFailure, Unit>> toReject(int id);

  /// To block user.
  Future<Either<AstraFailure, Unit>> toBlock(int id);

  /// Hide account.
  ///
  /// Account will be not visible for another users.
  Future<Either<AstraFailure, bool>> showAccount();
}
