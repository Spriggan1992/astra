import 'package:astra_app/domain/core/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

/// Describe profile api.
abstract class IProfileRepository {
  Future<Either<AstraFilure, dynamic>> getProfile();
  Future<Either<AstraFilure, dynamic>> hideAccount();
  Future<Either<AstraFilure, dynamic>> showAccount();
  Future<Either<AstraFilure, dynamic>> hideAccountInfo();
  Future<Either<AstraFilure, dynamic>> showAccountInfo();
  Future<Either<AstraFilure, dynamic>> addPhoto();
  Future<Either<AstraFilure, dynamic>> updatePhoto();
  Future<Either<AstraFilure, dynamic>> deletePhoto();
  Future<Either<AstraFilure, dynamic>> updateShortInfo();
  Future<Either<AstraFilure, dynamic>> updateStatus();
  Future<Either<AstraFilure, dynamic>> getStatuses();
}
