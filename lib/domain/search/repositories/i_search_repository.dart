import '../../applicant/applicant.dart';
import '../../core/failure/astra_failure.dart';
import 'package:dartz/dartz.dart';

/// Describes the request service to list of applicants.
abstract class ISearchRepository {
  /// Gets list of applicants
  Future<Either<AstraFailure, List<Applicant>>> getApplicants();
}
