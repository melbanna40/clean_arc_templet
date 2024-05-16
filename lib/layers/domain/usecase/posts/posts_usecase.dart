import 'package:dartz/dartz.dart';
import 'package:posts_app/layers/data/dto/posts_dto.dart';
import 'package:posts_app/layers/data/source/remote/failure/failure.dart';
import 'package:posts_app/layers/domain/repository/app_repository.dart';

class PostsUseCase {
  PostsUseCase({
    required AppRepository repository,
  }) : _repository = repository;

  final AppRepository _repository;

  Future<Either<Failure, List<PostsDataDto?>?>> call(
    Map<String, dynamic> params,
  ) async {
    return _repository.getPostsData(params);
  }
}
