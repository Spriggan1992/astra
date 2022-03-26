import 'package:astra_app/auth/domain/models/auth_info.dart';
import 'package:dartz/dartz.dart';
import '../failures/auth_failure.dart';

/// Describe authorization api methods.
abstract class IAuthApiService {
  /// Sign up user in the system
  Future<Either<AuthFailure, Unit>> signUp(AuthInfo authInfo);

  /// Sign in user in the system.
  Future<Either<AuthFailure, Unit>> signIn(AuthInfo authInfo);

  /// Check if user is signed in.
  Future<bool> isSignIn();

  /// Check [phone] if number has already been registered.
  Future<Either<AuthFailure, bool>> checkPhoneNumber(String phone);

  /// Sign out user.
  Future<void> signOut();
}
