import 'package:astra_app/infrastructure/core/services/subscription_service/subscription_service.dart';
import 'package:dart_amqp/dart_amqp.dart';

/// Represent settings connection for [SubscriptionService].
class SubscriptionConnectionSettings {
  /// Connection settings.
  static final ConnectionSettings settings = ConnectionSettings(
    host: '92.255.108.56',
    port: 5672,
    authProvider: const PlainAuthenticator("user", "password"),
  );
}
