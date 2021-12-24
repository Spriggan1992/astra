import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

/// Describe profile api.
abstract class IProfileRepository {
  Future<Either<AstraFailure, dynamic>> getProfile();
  Future<Either<AstraFailure, dynamic>> hideAccount();
  Future<Either<AstraFailure, dynamic>> showAccount();
  Future<Either<AstraFailure, dynamic>> hideAccountInfo();
  Future<Either<AstraFailure, dynamic>> showAccountInfo();
  Future<Either<AstraFailure, dynamic>> addPhoto();
  Future<Either<AstraFailure, dynamic>> updatePhoto();
  Future<Either<AstraFailure, dynamic>> deletePhoto();
  Future<Either<AstraFailure, dynamic>> updateShortInfo();
  Future<Either<AstraFailure, dynamic>> updateStatus();
  Future<Either<AstraFailure, dynamic>> getStatuses();
}
