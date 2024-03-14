import 'package:hive/hive.dart';
import 'package:posts_task/layers/domain/adapters/posts/owner_obj.dart';

part 'post_obj.g.dart';

@HiveType(typeId: 0)
class Post extends HiveObject {
  Post();

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    likes = json['likes'];
    tags = json['tags'].cast<String>();
    text = json['text'];
    publishDate = json['publishDate'];
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
  }

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? image;

  @HiveField(2)
  int? likes;

  @HiveField(3)
  List<String>? tags;

  @HiveField(4)
  String? text;

  @HiveField(5)
  String? publishDate;

  @HiveField(6)
  Owner? owner;
}

// var response = {
//   "id": "60d21b7f67d0d8992e610d2b",
//   "image": "https://img.dummyapi.io/photo-1577849304422-d019fdd6f29f.jpg",
//   "likes": 25,
//   "tags": [
//     "dog",
//     "animal",
//     "canine"
//   ],
//   "text": "Dogs black and brown Yorkshire Terrier",
//   "publishDate": "2020-05-19T02:55:23.015Z",
//   "owner": {
//     "id": "60d0fe4f5311236168a109e3",
//     "title": "mr",
//     "firstName": "Vetle",
//     "lastName": "Aasland",
//     "picture": "https://randomuser.me/api/portraits/med/men/97.jpg"
//   }
// }
