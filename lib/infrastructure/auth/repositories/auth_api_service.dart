import 'package:astra_app/domain/auth/failures/auth_failure.dart';
import 'package:astra_app/domain/auth/models/auth_info.dart';
import 'package:astra_app/infrastructure/auth/DTOs/auth_info_dto.dart';
import 'package:astra_app/infrastructure/auth/DTOs/token.dart';
import 'package:astra_app/infrastructure/auth/repositories/authenticator.dart';
import 'package:astra_app/infrastructure/core/database/secure_strorage/i_secure_storage.dart';
import 'package:astra_app/infrastructure/core/http/endpoints.dart';
import 'package:astra_app/infrastructure/core/http/make_request.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/repositories/i_auth_api_service.dart';

/// Service of authorization api methods.
@LazySingleton(as: IAuthApiService)
class AuthApiService implements IAuthApiService {
  /// Instance of the autherization service.
  final Authenticator _authenticator;

  /// Instance ot the local storage.
  final ISecureStorage _secureStorage;

  /// Instance ot the dio client.
  final Dio _dio;
  AuthApiService(this._dio, this._secureStorage, this._authenticator);

  @override
  Future<Either<AuthFailure, Unit>> signIn(AuthInfo authInfo) async {
    final result = await makeRequest<Unit>(() async {
      final response = await _dio.post(Endpoints.auth.login,
          data: AuthInfoDTO.fromDomain(authInfo));
      await _secureStorage.save(Token.fromJson(response.data));
      return unit;
    });
    return result.fold((failure) => left(failure), (success) => right(success));
  }

  @override
  Future<Either<AuthFailure, Unit>> signUp(AuthInfo authIndfo) async {
    /// TODO implement when back will be ready.
    return right(unit);
  }

  @override
  Future<bool> isSignIn() async => await _authenticator.isSignedIn();

  @override
  Future<void> signOut() async {
    _secureStorage.clear();
  }

  @override
  Future<Either<AuthFailure, bool>> checkPhoneNumber(String phone) async {
    final result = await makeRequest<bool>(() async {
      return await _dio.post(Endpoints.auth.checkPhone, data: {
        "phone_number": phone
      }).then((result) => result.data['success']);
    });
    return result.fold((failure) => left(failure), (success) => right(success));
  }
}
