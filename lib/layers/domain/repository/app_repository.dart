import 'package:dartz/dartz.dart';
import 'package:posts_task/layers/data/dto/posts_dto.dart';
import 'package:posts_task/layers/data/source/remote/failure/failure.dart';
import 'package:posts_task/layers/domain/adapters/posts/post_obj.dart';

abstract class AppRepository {
  Future<Either<Failure, List<Post>>> getPostsData(Map<String,dynamic> params);
}
