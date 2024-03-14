import 'package:hive/hive.dart';
import 'package:posts_task/layers/domain/adapters/posts/post_obj.dart';

const appKey = 'PostsTaskDbAppBox';

const postsBox = 'postsBox';

abstract class LocalStorage {
  Future<void> setPostsList(List<Post> countryCodeAdapter);

  Future<List<Post>?> getPostsList();
}

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl({
    required Box<dynamic> hiveBox,
    required Box<Post> posts,
  })  : _hiveBox = hiveBox,
        _posts = posts;
  final Box<dynamic> _hiveBox;
  final Box<Post> _posts;

  @override
  Future<void> setPostsList(List<Post> posts) async {
    await _posts.addAll(posts);
  }

  @override
  Future<List<Post>?> getPostsList() async {
    return _posts.values.toList();
  }
}
