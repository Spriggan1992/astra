/// Class for Shared Preferences interaction
abstract class ISharedStorage {
  /// Method for getting value by it`s [name]
  Future<dynamic> get(String name);

  /// Method for setting [value] for the [name]
  Future<void> set(String name, dynamic value);

  /// Method that checks presence of [name]
  Future<bool> contains(String name);

  /// Method that deletes [name] and it`s value
  Future<void> clear(String name);

  /// Method that clears all storage
  Future<void> clearAll();
}
