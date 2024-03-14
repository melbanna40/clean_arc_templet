import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_dto.freezed.dart';

part 'posts_dto.g.dart';

@unfreezed
class PostsDto with _$PostsDto {
  factory PostsDto({
    List<PostsDataDto?>? data,
    int? total,
    int? page,
    int? limit,
  }) = _PostsDto;

  factory PostsDto.fromJson(Map<String, dynamic> json) =>
      _$PostsDtoFromJson(json);
}

@unfreezed
class PostsDataDto with _$PostsDataDto {
  factory PostsDataDto({
    String? id,
    String? image,
    int? likes,
    List<String?>? tags,
    String? text,
    String? publishDate,
    PostsDataOwnerDto? owner,
  }) = _PostsDataDto;

  factory PostsDataDto.fromJson(Map<String, dynamic> json) =>
      _$PostsDataDtoFromJson(json);
}

@unfreezed
class PostsDataOwnerDto with _$PostsDataOwnerDto {
  factory PostsDataOwnerDto({
    String? id,
    String? title,
    String? firstName,
    String? lastName,
    String? picture,
  }) = _PostsDataOwnerDto;

  factory PostsDataOwnerDto.fromJson(Map<String, dynamic> json) =>
      _$PostsDataOwnerDtoFromJson(json);
}
