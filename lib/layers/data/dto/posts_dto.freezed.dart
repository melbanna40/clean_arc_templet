// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostsDto _$PostsDtoFromJson(Map<String, dynamic> json) {
  return _PostsDto.fromJson(json);
}

/// @nodoc
mixin _$PostsDto {
  List<PostsDataDto?>? get data => throw _privateConstructorUsedError;
  set data(List<PostsDataDto?>? value) => throw _privateConstructorUsedError;
  int? get total => throw _privateConstructorUsedError;
  set total(int? value) => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  set page(int? value) => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  set limit(int? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsDtoCopyWith<PostsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsDtoCopyWith<$Res> {
  factory $PostsDtoCopyWith(PostsDto value, $Res Function(PostsDto) then) =
      _$PostsDtoCopyWithImpl<$Res, PostsDto>;
  @useResult
  $Res call({List<PostsDataDto?>? data, int? total, int? page, int? limit});
}

/// @nodoc
class _$PostsDtoCopyWithImpl<$Res, $Val extends PostsDto>
    implements $PostsDtoCopyWith<$Res> {
  _$PostsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PostsDataDto?>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostsDtoImplCopyWith<$Res>
    implements $PostsDtoCopyWith<$Res> {
  factory _$$PostsDtoImplCopyWith(
          _$PostsDtoImpl value, $Res Function(_$PostsDtoImpl) then) =
      __$$PostsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PostsDataDto?>? data, int? total, int? page, int? limit});
}

/// @nodoc
class __$$PostsDtoImplCopyWithImpl<$Res>
    extends _$PostsDtoCopyWithImpl<$Res, _$PostsDtoImpl>
    implements _$$PostsDtoImplCopyWith<$Res> {
  __$$PostsDtoImplCopyWithImpl(
      _$PostsDtoImpl _value, $Res Function(_$PostsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$PostsDtoImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<PostsDataDto?>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsDtoImpl implements _PostsDto {
  _$PostsDtoImpl({this.data, this.total, this.page, this.limit});

  factory _$PostsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsDtoImplFromJson(json);

  @override
  List<PostsDataDto?>? data;
  @override
  int? total;
  @override
  int? page;
  @override
  int? limit;

  @override
  String toString() {
    return 'PostsDto(data: $data, total: $total, page: $page, limit: $limit)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsDtoImplCopyWith<_$PostsDtoImpl> get copyWith =>
      __$$PostsDtoImplCopyWithImpl<_$PostsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsDtoImplToJson(
      this,
    );
  }
}

abstract class _PostsDto implements PostsDto {
  factory _PostsDto(
      {List<PostsDataDto?>? data,
      int? total,
      int? page,
      int? limit}) = _$PostsDtoImpl;

  factory _PostsDto.fromJson(Map<String, dynamic> json) =
      _$PostsDtoImpl.fromJson;

  @override
  List<PostsDataDto?>? get data;
  set data(List<PostsDataDto?>? value);
  @override
  int? get total;
  set total(int? value);
  @override
  int? get page;
  set page(int? value);
  @override
  int? get limit;
  set limit(int? value);
  @override
  @JsonKey(ignore: true)
  _$$PostsDtoImplCopyWith<_$PostsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostsDataDto _$PostsDataDtoFromJson(Map<String, dynamic> json) {
  return _PostsDataDto.fromJson(json);
}

/// @nodoc
mixin _$PostsDataDto {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  set image(String? value) => throw _privateConstructorUsedError;
  int? get likes => throw _privateConstructorUsedError;
  set likes(int? value) => throw _privateConstructorUsedError;
  List<String?>? get tags => throw _privateConstructorUsedError;
  set tags(List<String?>? value) => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  set text(String? value) => throw _privateConstructorUsedError;
  String? get publishDate => throw _privateConstructorUsedError;
  set publishDate(String? value) => throw _privateConstructorUsedError;
  PostsDataOwnerDto? get owner => throw _privateConstructorUsedError;
  set owner(PostsDataOwnerDto? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsDataDtoCopyWith<PostsDataDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsDataDtoCopyWith<$Res> {
  factory $PostsDataDtoCopyWith(
          PostsDataDto value, $Res Function(PostsDataDto) then) =
      _$PostsDataDtoCopyWithImpl<$Res, PostsDataDto>;
  @useResult
  $Res call(
      {String? id,
      String? image,
      int? likes,
      List<String?>? tags,
      String? text,
      String? publishDate,
      PostsDataOwnerDto? owner});

  $PostsDataOwnerDtoCopyWith<$Res>? get owner;
}

/// @nodoc
class _$PostsDataDtoCopyWithImpl<$Res, $Val extends PostsDataDto>
    implements $PostsDataDtoCopyWith<$Res> {
  _$PostsDataDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? likes = freezed,
    Object? tags = freezed,
    Object? text = freezed,
    Object? publishDate = freezed,
    Object? owner = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as PostsDataOwnerDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostsDataOwnerDtoCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $PostsDataOwnerDtoCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PostsDataDtoImplCopyWith<$Res>
    implements $PostsDataDtoCopyWith<$Res> {
  factory _$$PostsDataDtoImplCopyWith(
          _$PostsDataDtoImpl value, $Res Function(_$PostsDataDtoImpl) then) =
      __$$PostsDataDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? image,
      int? likes,
      List<String?>? tags,
      String? text,
      String? publishDate,
      PostsDataOwnerDto? owner});

  @override
  $PostsDataOwnerDtoCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$PostsDataDtoImplCopyWithImpl<$Res>
    extends _$PostsDataDtoCopyWithImpl<$Res, _$PostsDataDtoImpl>
    implements _$$PostsDataDtoImplCopyWith<$Res> {
  __$$PostsDataDtoImplCopyWithImpl(
      _$PostsDataDtoImpl _value, $Res Function(_$PostsDataDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? likes = freezed,
    Object? tags = freezed,
    Object? text = freezed,
    Object? publishDate = freezed,
    Object? owner = freezed,
  }) {
    return _then(_$PostsDataDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      publishDate: freezed == publishDate
          ? _value.publishDate
          : publishDate // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as PostsDataOwnerDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsDataDtoImpl implements _PostsDataDto {
  _$PostsDataDtoImpl(
      {this.id,
      this.image,
      this.likes,
      this.tags,
      this.text,
      this.publishDate,
      this.owner});

  factory _$PostsDataDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsDataDtoImplFromJson(json);

  @override
  String? id;
  @override
  String? image;
  @override
  int? likes;
  @override
  List<String?>? tags;
  @override
  String? text;
  @override
  String? publishDate;
  @override
  PostsDataOwnerDto? owner;

  @override
  String toString() {
    return 'PostsDataDto(id: $id, image: $image, likes: $likes, tags: $tags, text: $text, publishDate: $publishDate, owner: $owner)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsDataDtoImplCopyWith<_$PostsDataDtoImpl> get copyWith =>
      __$$PostsDataDtoImplCopyWithImpl<_$PostsDataDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsDataDtoImplToJson(
      this,
    );
  }
}

abstract class _PostsDataDto implements PostsDataDto {
  factory _PostsDataDto(
      {String? id,
      String? image,
      int? likes,
      List<String?>? tags,
      String? text,
      String? publishDate,
      PostsDataOwnerDto? owner}) = _$PostsDataDtoImpl;

  factory _PostsDataDto.fromJson(Map<String, dynamic> json) =
      _$PostsDataDtoImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get image;
  set image(String? value);
  @override
  int? get likes;
  set likes(int? value);
  @override
  List<String?>? get tags;
  set tags(List<String?>? value);
  @override
  String? get text;
  set text(String? value);
  @override
  String? get publishDate;
  set publishDate(String? value);
  @override
  PostsDataOwnerDto? get owner;
  set owner(PostsDataOwnerDto? value);
  @override
  @JsonKey(ignore: true)
  _$$PostsDataDtoImplCopyWith<_$PostsDataDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PostsDataOwnerDto _$PostsDataOwnerDtoFromJson(Map<String, dynamic> json) {
  return _PostsDataOwnerDto.fromJson(json);
}

/// @nodoc
mixin _$PostsDataOwnerDto {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  set title(String? value) => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  set firstName(String? value) => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  set lastName(String? value) => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  set picture(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsDataOwnerDtoCopyWith<PostsDataOwnerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsDataOwnerDtoCopyWith<$Res> {
  factory $PostsDataOwnerDtoCopyWith(
          PostsDataOwnerDto value, $Res Function(PostsDataOwnerDto) then) =
      _$PostsDataOwnerDtoCopyWithImpl<$Res, PostsDataOwnerDto>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? firstName,
      String? lastName,
      String? picture});
}

/// @nodoc
class _$PostsDataOwnerDtoCopyWithImpl<$Res, $Val extends PostsDataOwnerDto>
    implements $PostsDataOwnerDtoCopyWith<$Res> {
  _$PostsDataOwnerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? picture = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostsDataOwnerDtoImplCopyWith<$Res>
    implements $PostsDataOwnerDtoCopyWith<$Res> {
  factory _$$PostsDataOwnerDtoImplCopyWith(_$PostsDataOwnerDtoImpl value,
          $Res Function(_$PostsDataOwnerDtoImpl) then) =
      __$$PostsDataOwnerDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? firstName,
      String? lastName,
      String? picture});
}

/// @nodoc
class __$$PostsDataOwnerDtoImplCopyWithImpl<$Res>
    extends _$PostsDataOwnerDtoCopyWithImpl<$Res, _$PostsDataOwnerDtoImpl>
    implements _$$PostsDataOwnerDtoImplCopyWith<$Res> {
  __$$PostsDataOwnerDtoImplCopyWithImpl(_$PostsDataOwnerDtoImpl _value,
      $Res Function(_$PostsDataOwnerDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? picture = freezed,
  }) {
    return _then(_$PostsDataOwnerDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostsDataOwnerDtoImpl implements _PostsDataOwnerDto {
  _$PostsDataOwnerDtoImpl(
      {this.id, this.title, this.firstName, this.lastName, this.picture});

  factory _$PostsDataOwnerDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostsDataOwnerDtoImplFromJson(json);

  @override
  String? id;
  @override
  String? title;
  @override
  String? firstName;
  @override
  String? lastName;
  @override
  String? picture;

  @override
  String toString() {
    return 'PostsDataOwnerDto(id: $id, title: $title, firstName: $firstName, lastName: $lastName, picture: $picture)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostsDataOwnerDtoImplCopyWith<_$PostsDataOwnerDtoImpl> get copyWith =>
      __$$PostsDataOwnerDtoImplCopyWithImpl<_$PostsDataOwnerDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostsDataOwnerDtoImplToJson(
      this,
    );
  }
}

abstract class _PostsDataOwnerDto implements PostsDataOwnerDto {
  factory _PostsDataOwnerDto(
      {String? id,
      String? title,
      String? firstName,
      String? lastName,
      String? picture}) = _$PostsDataOwnerDtoImpl;

  factory _PostsDataOwnerDto.fromJson(Map<String, dynamic> json) =
      _$PostsDataOwnerDtoImpl.fromJson;

  @override
  String? get id;
  set id(String? value);
  @override
  String? get title;
  set title(String? value);
  @override
  String? get firstName;
  set firstName(String? value);
  @override
  String? get lastName;
  set lastName(String? value);
  @override
  String? get picture;
  set picture(String? value);
  @override
  @JsonKey(ignore: true)
  _$$PostsDataOwnerDtoImplCopyWith<_$PostsDataOwnerDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
