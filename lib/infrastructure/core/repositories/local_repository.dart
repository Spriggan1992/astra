import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Shared preferances repository.
@lazySingleton
class LocalRepository {
  final SharedPreferences _pref;

  static String keyPassword = 'password';

  LocalRepository(this._pref);

  Future<void> save(String key, String value) async {
    await _pref.setString(key, value);
  }

  Future<String?> get(String key) async {
    final String? _value = _pref.getString(key);
    return Future.value(_value);
  }

  Future<void> delete(String key) async {
    await _pref.remove(key);
  }

  Future<bool> hasValue(String key) async {
    final _hasValue = _pref.containsKey(key);
    return Future.value(_hasValue);
  }
}
