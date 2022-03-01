import 'package:astra_app/infrastructure/core/database/shared_storage/i_shared_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../injection.dart';

/// Class for Shared Preferences interaction
@LazySingleton(as: ISharedStorage)
class SharedStorage implements ISharedStorage {
  // instance of Shared Preferences
  final _prefs = getIt<SharedPreferences>();

  @override
  Future<bool> contains(String name) async {
    return _prefs.containsKey(name);
  }

  @override
  Future<void> clear(String name) async {
    _prefs.remove(name);
  }

  @override
  Future<void> clearAll() async {
    _prefs.clear();
  }

  @override
  Future get(String name) async {
    return _prefs.get(name);
  }

  @override
  Future<void> set(String name, value) async {
    switch (value.runtimeType) {
      case String:
        _prefs.setString(name, value as String);
        break;
      case int:
        _prefs.setInt(name, value as int);
        break;
      case bool:
        _prefs.setBool(name, value as bool);
        break;
      case double:
        _prefs.setDouble(name, value as double);
        break;
      case Null:
        _prefs.remove(name);
        break;
      default:
        _prefs.setString(name, value.toString());
    }
  }
}
