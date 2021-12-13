import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

/// Defines class of initialization sembast database.
class SembastDatabase {
  late Database _instance;

  /// Get database instance.
  Database get instance => _instance;

  bool _hasBeenInitialized = false;

  Future<void> init() async {
    if (_hasBeenInitialized) return;
    _hasBeenInitialized = true;
    final dbDirectoiry = await getApplicationDocumentsDirectory();
    dbDirectoiry.create(recursive: true);
    final dbPath = join(dbDirectoiry.path, 'db.sembast');
    _instance = await databaseFactoryIo.openDatabase(dbPath);
  }
}
