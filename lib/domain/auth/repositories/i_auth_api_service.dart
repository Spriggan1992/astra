import 'package:astra_app/domain/auth/models/auth_info.dart';
import 'package:dartz/dartz.dart';
import '../failures/auth_failure.dart';

/// Describe authorization api methods.
abstract class IAuthApiService {
  /// Sign up user in the system
  Future<Either<AuthFailure, Unit>> signUp(AuthInfo authInfo);

  /// Sign in user in the system.
  Future<Either<AuthFailure, Unit>> signIn(AuthInfo authInfo);

  /// Checkt if user is sign in.
  Future<bool> isSignIn();

  /// Check [phone] if number has aready been registerd.
  Future<Either<AuthFailure, bool>> checkPhoneNumber(String phone);

  /// Sign out user.
  Future<void> signOut();
}
