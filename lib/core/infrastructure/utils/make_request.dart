import 'dart:developer';

import 'package:astra_app/core/domain/failure/astra_failure.dart';
import 'package:astra_app/core/infrastructure/extensions/dio_extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// The callback request
typedef CallBackRequest<T> = Future<T> Function();

/// Make http request.
///
/// Returns [Either] there left is [AstraFailure] and right is [T].
Future<Either<AstraFailure, T>> makeRequest<T>(CallBackRequest callback) async {
  try {
    final response = await callback();
    log("$response", name: "success_response");
    return right(response);
  } on DioError catch (e) {
    log("${e.message}: ${e.type}; response: ${e.response}", level: 2);
    if (e.isNoConnectionError) {
      log("${e.message}: ${e.type}", level: 2);
      return left(const AstraFailure.noConnection());
    } else {
      if (e.response?.data['errorMessage'] == 'Пополните баланс.') {
        log("${e.message}: ${e.type}", level: 2);
        return left(
            AstraFailure.api(errorMessage: e.response?.data['errorMessage']));
      } else {
        log("${e.message}: ${e.type}", level: 2);
        return left(const AstraFailure.api());
      }
    }
  } catch (e) {
    log(e.toString(), level: 2);
    return left(const AstraFailure.api());
  }
}
