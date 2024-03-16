// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Posts extends _Posts with RealmEntity, RealmObjectBase, RealmObject {
  Posts({
    String? id,
    String? image,
    int? likes,
    String? text,
    String? publishDate,
    Owner? owner,
    Iterable<String> tags = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'image', image);
    RealmObjectBase.set(this, 'likes', likes);
    RealmObjectBase.set(this, 'text', text);
    RealmObjectBase.set(this, 'publishDate', publishDate);
    RealmObjectBase.set(this, 'owner', owner);
    RealmObjectBase.set<RealmList<String>>(
        this, 'tags', RealmList<String>(tags));
  }

  Posts._();

  @override
  String? get id => RealmObjectBase.get<String>(this, 'id') as String?;
  @override
  set id(String? value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get image => RealmObjectBase.get<String>(this, 'image') as String?;
  @override
  set image(String? value) => RealmObjectBase.set(this, 'image', value);

  @override
  int? get likes => RealmObjectBase.get<int>(this, 'likes') as int?;
  @override
  set likes(int? value) => RealmObjectBase.set(this, 'likes', value);

  @override
  RealmList<String> get tags =>
      RealmObjectBase.get<String>(this, 'tags') as RealmList<String>;
  @override
  set tags(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get text => RealmObjectBase.get<String>(this, 'text') as String?;
  @override
  set text(String? value) => RealmObjectBase.set(this, 'text', value);

  @override
  String? get publishDate =>
      RealmObjectBase.get<String>(this, 'publishDate') as String?;
  @override
  set publishDate(String? value) =>
      RealmObjectBase.set(this, 'publishDate', value);

  @override
  Owner? get owner => RealmObjectBase.get<Owner>(this, 'owner') as Owner?;
  @override
  set owner(covariant Owner? value) =>
      RealmObjectBase.set(this, 'owner', value);

  @override
  Stream<RealmObjectChanges<Posts>> get changes =>
      RealmObjectBase.getChanges<Posts>(this);

  @override
  Posts freeze() => RealmObjectBase.freezeObject<Posts>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Posts._);
    return const SchemaObject(ObjectType.realmObject, Posts, 'Posts', [
      SchemaProperty('id', RealmPropertyType.string, optional: true),
      SchemaProperty('image', RealmPropertyType.string, optional: true),
      SchemaProperty('likes', RealmPropertyType.int, optional: true),
      SchemaProperty('tags', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('text', RealmPropertyType.string, optional: true),
      SchemaProperty('publishDate', RealmPropertyType.string, optional: true),
      SchemaProperty('owner', RealmPropertyType.object,
          optional: true, linkTarget: 'Owner'),
    ]);
  }
}

class Owner extends _Owner with RealmEntity, RealmObjectBase, RealmObject {
  Owner({
    String? id,
    String? title,
    String? firstName,
    String? lastName,
    String? picture,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'firstName', firstName);
    RealmObjectBase.set(this, 'lastName', lastName);
    RealmObjectBase.set(this, 'picture', picture);
  }

  Owner._();

  @override
  String? get id => RealmObjectBase.get<String>(this, 'id') as String?;
  @override
  set id(String? value) => RealmObjectBase.set(this, 'id', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get firstName =>
      RealmObjectBase.get<String>(this, 'firstName') as String?;
  @override
  set firstName(String? value) => RealmObjectBase.set(this, 'firstName', value);

  @override
  String? get lastName =>
      RealmObjectBase.get<String>(this, 'lastName') as String?;
  @override
  set lastName(String? value) => RealmObjectBase.set(this, 'lastName', value);

  @override
  String? get picture =>
      RealmObjectBase.get<String>(this, 'picture') as String?;
  @override
  set picture(String? value) => RealmObjectBase.set(this, 'picture', value);

  @override
  Stream<RealmObjectChanges<Owner>> get changes =>
      RealmObjectBase.getChanges<Owner>(this);

  @override
  Owner freeze() => RealmObjectBase.freezeObject<Owner>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Owner._);
    return const SchemaObject(ObjectType.realmObject, Owner, 'Owner', [
      SchemaProperty('id', RealmPropertyType.string, optional: true),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('firstName', RealmPropertyType.string, optional: true),
      SchemaProperty('lastName', RealmPropertyType.string, optional: true),
      SchemaProperty('picture', RealmPropertyType.string, optional: true),
    ]);
  }
}
