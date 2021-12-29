import 'dart:developer';

import 'package:astra_app/domain/auth/failures/auth_failure.dart';
import 'package:astra_app/infrastructure/auth/extentions/dio_extensions.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

/// The callback request
typedef CallBackRequest<T> = Future<T> Function();

/// Make http request.
///
/// Returns [Either] there left is [AuthFailure] and right is [T].
Future<Either<AuthFailure, T>> makeAuthRequest<T>(
  CallBackRequest callback,
) async {
  try {
    return right(await callback());
  } on FormatException catch (e) {
    log("${e.message}: ${e.source}", level: 2);
    return left(const AuthFailure.server("что то пошло не так..."));
  } on PlatformException catch (e) {
    log("${e.message}: ${e.code}", level: 2);
    return left(const AuthFailure.storage());
  } on DioError catch (e) {
    if (e.isNoConnectionError) {
      return left(const AuthFailure.noConnection());
    }
    log("${e.message}: ${e.type}", level: 2, name: "DioException");
    return left(AuthFailure.server(e.response!.data['message']));
  }
}
