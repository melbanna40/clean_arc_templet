import 'dart:async';

 import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:posts_app/layers/data/source/local/local_storage.dart';

class HiveManager {
  HiveManager._();

  bool _hasBeenInitialised = false;

  static final HiveManager _singleton = HiveManager._();

  static HiveManager get instance => _singleton;

  late Box<dynamic> _database;

  Box<dynamic> get database => _database;

  Future<void> initialize() async {
    if (_hasBeenInitialised) return;
    _hasBeenInitialised = true;
    final dbDirectory = await getApplicationDocumentsDirectory();
    Hive.init(dbDirectory.path)
        // ..registerAdapter(LoginHiveObjectAdapter())
        ;

    _database = await Hive.openBox(appKey);
  }
}
