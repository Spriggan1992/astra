import 'dart:developer';

import 'package:astra_app/auth/infrastructure/extensions/dio_extensions.dart';
import 'package:astra_app/settings/domain/promocode/promocode_failure.dart';
import 'package:astra_app/settings/infrastructure/promocode/extensions/failure_response_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

/// The callback request
typedef CallBackRequest<PromocodeModel> = Future<PromocodeModel> Function();

/// Make http request.
///
/// Returns [Either] there left is [AstraFailure] and right is [T].
Future<Either<PromocodeFailure, PromocodeModel>>
    makePromocodeRequest<PromocodeModel>(CallBackRequest callback,
        [String from = '']) async {
  try {
    final response = await callback();
    log("$response", name: "success_response, from: $from");
    return right(response);
  } on DioError catch (e) {
    log("${e.message}: ${e.type}; response: ${e.response}", level: 2);
    if (e.isNoConnectionError) {
      log("${e.message}: ${e.type}", level: 2);
      return left(const PromocodeFailure.noConnection());
    } else if (e.response?.statusCode == 400) {
      return left((e.response?.data as Map<String, dynamic>).failure);
    } else {
      log("${e.message}: ${e.type}", level: 2);
      return left(const PromocodeFailure.api());
    }
  } catch (e) {
    return left(const PromocodeFailure.api());
  }
}
