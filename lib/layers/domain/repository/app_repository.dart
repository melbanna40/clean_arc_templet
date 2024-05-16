import 'package:dartz/dartz.dart';
import 'package:posts_task/layers/data/dto/posts_dto.dart';
import 'package:posts_task/layers/data/source/remote/failure/failure.dart';

abstract class AppRepository {
  Future<Either<Failure, List<PostsDataDto?>?>> getPostsData(
    Map<String, dynamic> params,
  );
}
