import 'package:astra_app/domain/auth/failures/auth_failure.dart';
import 'package:astra_app/infrastructure/auth/DTOs/token.dart';
import 'package:astra_app/infrastructure/core/database/secure_strorage/i_secure_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

/// Autherization service.
@lazySingleton
class Authenticator {
  /// Secure storage instance.
  final ISecureStorage _secureStorage;

  /// Dio client instance.
  final Dio _dio;

  Authenticator(this._dio, this._secureStorage);

  /// Get signedin token.
  ///
  /// Return null if will be thrown [PlatformException] and [FormatException].
  Future<Token?> getSignedToken() async {
    try {
      final token = await _secureStorage.read();
      if (token != null) {
        if (JwtDecoder.isExpired(token.access)) {
          final failureOrToken = await refresh(token.refresh);
          return failureOrToken.fold((l) => null, (r) => r);
        }
      }
      return token;
    } on PlatformException {
      return null;
    } on FormatException {
      return null;
    }
  }

  /// Check if user already signed in.
  Future<bool> isSignedIn() => getSignedToken().then((token) => token != null);

  Future<Either<AuthFailure, Unit>> clearSecureStorage() async {
    try {
      await _secureStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  /// Refresh access token by refresh token.
  Future<Either<AuthFailure, Token>> refresh(
    String toke,
  ) async {
    try {
      /// TODO Here should be logic with exchange token.
      final refreshedToken = await _dio.post("acess token should be put here");
      final token = Token(
          access: "acess token should be put here",
          refresh: "refresh token should be put here");
      await _secureStorage.save(token);
      return right(refreshedToken.data);
    } on FormatException {
      return left(const AuthFailure.server());
    } on DioError catch (e) {
      return left(AuthFailure.server('${e.error}: ${e.message}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
