import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:posts_task/layers/data/source/local/local_storage.dart';
import 'package:posts_task/layers/domain/adapters/posts/owner_obj.dart';
import 'package:posts_task/layers/domain/adapters/posts/post_obj.dart';

class HiveManager {
  HiveManager._();

  bool _hasBeenInitialised = false;

  static final HiveManager _singleton = HiveManager._();

  static HiveManager get instance => _singleton;

  late Box<dynamic> _database;

  Box<dynamic> get database => _database;

  late Box<Post> _posts;

  Box<Post> get posts => _posts;

  Future<void> initialize() async {
    if (_hasBeenInitialised) return;
    _hasBeenInitialised = true;
    final dbDirectory = await getApplicationDocumentsDirectory();
    Hive
      ..init(dbDirectory.path)
      ..registerAdapter(PostAdapter())
      ..registerAdapter(OwnerAdapter());

    _database = await Hive.openBox(appKey);

    _posts = await Hive.openBox<Post>(postsBox);
  }
}
