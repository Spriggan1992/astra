import 'package:astra_app/domain/auth/entities/auth_info.dart';
import 'package:astra_app/domain/auth/failures/auth_failure.dart';
import 'package:astra_app/infrastructure/auth/DTOs/auth_info_dto.dart';
import 'package:astra_app/infrastructure/auth/repositories/i_local_storage.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/i_auth_api_service.dart';

/// Service of authorization api methods.
@LazySingleton(as: IAuthApiService)
class AuthApiService implements IAuthApiService {
  final ILocalStorage _localStorage;

  AuthApiService(this._localStorage);
  @override
  Future<Either<AuthFailure, AuthInfoDTO>> getAuthInfo(String phone) async {
    try {
      final result = await _localStorage.getAuthInfoByPhone(phone);
      return right(result);
    } catch (e) {
      return left(const AuthFailure.server("что-то пошло не так..."));
    }
  }

  @override
  Future<Either<AuthFailure, AuthInfoDTO>> signIn(AuthInfo authInfo) async {
    try {
      final result =
          await _localStorage.getAuthInfoByPhone(authInfo.phoneNumber);
      await _localStorage.putAuthInfo(result.copyWith(isSignIn: true));
      return right(result);
    } catch (e) {
      return left(const AuthFailure.server("что-то пошло не так..."));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signUp(AuthInfo authIndfo) async {
    try {
      final dto = AuthInfoDTO.fromDomain(authIndfo);
      await _localStorage.putAuthInfo(dto);
      return right(unit);
    } catch (e) {
      return left(
        const AuthFailure.server("что-то пошло не так..."),
      );
    }
  }

  @override
  Future<Either<AuthFailure, AuthInfoDTO>> isSignIn() async {
    final response = await _localStorage.getAuthInfo();
    if (response != null) {
      return right(response);
    } else {
      return left(const AuthFailure.userNotExist());
    }
  }

  @override
  Future<void> signOut() async {
    await _localStorage.removeAuthInfo();
  }
}
