import 'package:astra_app/domain/promocode/promocode_failure.dart';
import 'package:astra_app/domain/promocode/promocode_model.dart';
import 'package:astra_app/domain/promocode/i_promocode_repository.dart';
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
      String promocode) async {
    // Todo Replace when back will be ready.
    await Future.delayed(const Duration(milliseconds: 500));
    const fakeCode = "FFFF-FFFF-FFFF";
    const fakeCodeIsNotValid = "FFFF-FFFF-FFFA";
    if (promocode == fakeCode) {
      return right(
          const PromocodeModel(isActivated: true, code: fakeCode, likes: 5));
    } else if (promocode == fakeCodeIsNotValid) {
      return left(const PromocodeFailure.isNotValid());
    } else {
      return left(const PromocodeFailure.notExist());
    }
    // final result = await makeRequest<Unit>(() async {
    //   await _dio.post("", data: {"": ""});
    //   return unit;
    // });
    // return result.fold((failure) => left(failure), (success) => right(success));
  }
}
