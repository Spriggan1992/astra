import 'package:astra_app/infrastructure/core/database/sembast/sembast_database.dart';
import 'package:astra_app/infrastructure/core/services/subscription_service/subscription_connection_settings.dart';
import 'package:dart_amqp/dart_amqp.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Main module for injection.
@module
abstract class AppInjectableModule {
  /// Initialized  [SharedPreferences].
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  /// Initialized sembast database.
  @lazySingleton
  SembastDatabase get sembastDb => SembastDatabase();

  /// Initialized flutter secure storage.
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage();

  /// Initialized dio client.
  @lazySingleton
  Dio get dio => Dio();

  /// Initialized imagePicker service.
  @lazySingleton
  ImagePicker get imagePicker => ImagePicker();

  /// Initialized manager for caching network images.
  @lazySingleton
  DefaultCacheManager get cacheManager => DefaultCacheManager();

  /// Initialized client for Advanced Message Queuing Protocol.
  @lazySingleton
  Client get ampqClient =>
      Client(settings: SubscriptionConnectionSettings.settings);
}
