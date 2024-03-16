import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:posts_task/layers/data/dto/posts_dto.dart';
import 'package:posts_task/layers/data/source/remote/failure/error_handler.dart';
import 'package:posts_task/layers/data/source/remote/failure/failure.dart';
import 'package:posts_task/layers/domain/models/posts_model.dart';

final posts = [
  Posts(
    id: 'element?.id',
    image: 'element?.image',
    tags: ['', ''].where((element) => element != null).cast<String>().toList(),
    publishDate: 'element.publishDate',
    text: 'element.text',
    likes: 22,
    owner: Owner(
      id: 'element.owner?.id',
      firstName: 'element.owner?.firstName',
      lastName: 'element.owner?.lastName',
      picture: 'element.owner?.picture',
      title: 'element.owner?.title',
    ),
  )
];

Future<Either<Failure, List<Posts>>> postsList() async {
  if (Random().nextBool() == true) {
    return Right(posts);
  } else {
    return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  }
}

Future<List<Posts>> futurePostsList() async {
  return posts;
}

Future<PostsDto> futurePostsFromDtoList() async {
  return postsFromDto;
}

final postsFromDto = PostsDto(
  data: [
    PostsDataDto.fromJson({
      'id': '60d21bea67d0d8992e610e6a',
      'image': 'https://img.dummyapi.io/photo-1569796922509-d2846284929e.jpg',
      'likes': 29,
      'tags': ['grey', 'pet', 'mammal'],
      'text': 'close-up photo of white English Bulldog',
      'publishDate': '2020-05-17T16:08:18.433Z',
      'owner': {
        'id': '60d0fe4f5311236168a109cd',
        'title': 'mr',
        'firstName': 'Roberto',
        'lastName': 'Vega',
        'picture': 'https://randomuser.me/api/portraits/med/men/25.jpg',
      },
    }),
    PostsDataDto.fromJson({
      'id': '60d21bea67d0d8992e610e6a',
      'image': 'https://img.dummyapi.io/photo-1569796922509-d2846284929e.jpg',
      'likes': 29,
      'tags': ['grey', 'pet', 'mammal'],
      'text': 'close-up photo of white English Bulldog',
      'publishDate': '2020-05-17T16:08:18.433Z',
      'owner': {
        'id': '60d0fe4f5311236168a109cd',
        'title': 'mr',
        'firstName': 'Roberto',
        'lastName': 'Vega',
        'picture': 'https://randomuser.me/api/portraits/med/men/25.jpg',
      },
    }),
  ],
);
