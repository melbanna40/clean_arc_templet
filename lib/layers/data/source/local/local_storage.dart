import 'package:posts_task/layers/domain/models/posts_model.dart';
import 'package:realm/realm.dart';

const appKey = 'PostssTaskDbAppBox';

const postsBox = 'postsBox';

abstract class LocalStorage {
  Future<void> setPostsList(List<Posts> countryCodeAdapter);

  Future<List<Posts>?> getPostsList();
}

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl({
    required Realm realmDB,
  }) : _realmDB = realmDB;
  final Realm _realmDB;

  @override
  Future<void> setPostsList(List<Posts> posts) async {
    _realmDB.write(() {
      _realmDB.addAll(posts);
    });
  }

  @override
  Future<List<Posts>?> getPostsList() async {
    return _realmDB.all<Posts>().toList();
  }
}
