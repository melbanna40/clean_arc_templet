import 'package:realm/realm.dart';
part 'posts_model.g.dart';

@RealmModel()
class _Posts {
  String? id;
  String? image;
  int? likes;
  List<String> tags=[];
  String? text;
  String? publishDate;
  _Owner? owner;
}

@RealmModel()
class _Owner {
  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;
}
