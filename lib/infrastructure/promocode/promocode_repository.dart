import 'package:astra_app/domain/promocode/promocode_failure.dart';
import 'package:astra_app/domain/promocode/promocode_model.dart';
import 'package:astra_app/domain/promocode/i_promocode_repository.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/promocode/promocode_dto.dart';
import 'package:astra_app/infrastructure/promocode/utils/make_promocode_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

/// Defines repository for promocode.
@LazySingleton(as: IPromocodeRepository)
class PromocodeRepository implements IPromocodeRepository {
  /// Dio client.
  final Dio _dio;

  PromocodeRepository(this._dio);
  @override
  Future<Either<PromocodeFailure, PromocodeModel>> sendPromocode(
      PromocodeModel promocode) async {
    return await makePromocodeRequest(() async {
      return await _dio
          .post(Endpoints.promocode.activate,
              data: PromocodeDTO.fromDomain(promocode))
          .then((value) => PromocodeDTO.fromJson(value.data).toDomain());
    });
  }
}
