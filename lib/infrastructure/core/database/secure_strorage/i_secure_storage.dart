import 'package:astra_app/infrastructure/auth/DTOs/token.dart';

/// Describe method of secure storage.
abstract class ISecureStorage {
  /// Get token.
  Future<Token?> read();

  /// Save token.
  Future<void> save(Token token);

  /// Cleare storage.
  Future<void> clear();
}
