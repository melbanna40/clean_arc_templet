import 'package:hive/hive.dart';

part 'owner_obj.g.dart';

@HiveType(typeId: 1)
class Owner extends HiveObject {
  Owner();

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? title;

  @HiveField(2)
  String? firstName;

  @HiveField(3)
  String? lastName;

  @HiveField(4)
  String? picture;
}
