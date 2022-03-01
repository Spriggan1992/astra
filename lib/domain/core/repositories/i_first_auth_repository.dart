/// Describes repository for Shared Preferences interaction
abstract class IFirstAuthRepository {
  /// Whether the user have already signed in.
  Future<bool> isFirstAuth();

  /// Whether the user have already signed in.
  Future<bool> isSecondAuth();

  /// Set first authorization.
  Future<void> setFirstAuth(bool value);

  /// Set first authorization.
  Future<void> setSecondAuth(bool value);

  // /// Set
  // Future<void> setNotFirstAuth();
}
