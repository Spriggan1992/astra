import 'package:astra_app/api/auth/infrastructure/sembast_database.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Main module for injection.
@module
abstract class AppInjectableModule {
  /// Initialized  [SharedPreferences].
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  /// Initialized sembast database.
  @lazySingleton
  SembastDatabase get sembastDb => SembastDatabase();
}
