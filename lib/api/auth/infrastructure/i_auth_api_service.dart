import 'package:astra_app/api/auth/domain/auth_failure.dart';
import 'package:astra_app/api/auth/domain/auth_info.dart';
import 'package:dartz/dartz.dart';

import 'models/auth_info_dto.dart';

/// Describe authorization api methods.
abstract class IAuthApiService {
  /// Get auth information.
  ///
  /// `phone` Phone number.
  Future<Either<AuthFailure, AuthInfoDTO>> getAuthInfo(String phone);

  /// Sign up user in the system.
  ///
  /// `phone` Phone number.
  Future<Either<AuthFailure, Unit>> signUp(AuthInfo authInfo);

  /// Sign in user in the system.
  ///
  /// `phone` Phone number.
  Future<Either<AuthFailure, AuthInfoDTO>> signIn(AuthInfo authInfo);

  /// Checkt if user is sign in.
  Future<Either<AuthFailure, AuthInfoDTO>> isSignIn();

  /// Sign out user.
  Future<void> signOut();
}
