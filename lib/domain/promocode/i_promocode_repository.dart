import 'package:astra_app/domain/promocode/promocode_failure.dart';
import 'package:astra_app/domain/promocode/promocode_model.dart';
import 'package:dartz/dartz.dart';

/// Describe api for promocode.
abstract class IPromocodeRepository {
  /// Send promocode to the server.
  Future<Either<PromocodeFailure, PromocodeModel>> sendPromocode(
      String promocode);
}
