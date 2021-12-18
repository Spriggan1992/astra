import 'package:astra_app/infrastructure/core/database/sembast/sembast_database.dart';
import 'package:dio/dio.dart';
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
}
