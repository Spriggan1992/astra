part of 'auth_bloc.dart';

/// Describe event authorization.
@freezed
abstract class AuthEvent with _$AuthEvent {
  /// Check authorization event.
  const factory AuthEvent.authCheckRequested() = _AuthCheckRequested;

  /// Check balance event.
  const factory AuthEvent.balanceChecked() = _BalanceChecked;

  /// Set first auth event.
  const factory AuthEvent.firstAuthSet() = _IsFirstAuthSet;

  /// Check first auth event.
  const factory AuthEvent.firstAuthChecked(bool hasLikes) = _FirstAuthChecked;

  /// Sign out event.
  const factory AuthEvent.signedOut() = _SignedOut;
}
