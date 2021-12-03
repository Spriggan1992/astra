import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  late SharedPreferences _pref;

  LocalRepository() {
    initialize();
  }

  static String keyPassword = 'password';

  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
  }

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
