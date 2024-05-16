// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostsDtoImpl _$$PostsDtoImplFromJson(Map<String, dynamic> json) =>
    _$PostsDtoImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PostsDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PostsDtoImplToJson(_$PostsDtoImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };

_$PostsDataDtoImpl _$$PostsDataDtoImplFromJson(Map<String, dynamic> json) =>
    _$PostsDataDtoImpl(
      id: json['id'] as String?,
      image: json['image'] as String?,
      likes: (json['likes'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      text: json['text'] as String?,
      publishDate: json['publishDate'] as String?,
      owner: json['owner'] == null
          ? null
          : PostsDataOwnerDto.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostsDataDtoImplToJson(_$PostsDataDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'likes': instance.likes,
      'tags': instance.tags,
      'text': instance.text,
      'publishDate': instance.publishDate,
      'owner': instance.owner,
    };

_$PostsDataOwnerDtoImpl _$$PostsDataOwnerDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PostsDataOwnerDtoImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$$PostsDataOwnerDtoImplToJson(
        _$PostsDataOwnerDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'picture': instance.picture,
    };
