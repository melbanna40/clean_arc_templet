import 'package:dartz/dartz.dart';
import 'package:posts_task/layers/data/source/remote/failure/failure.dart';
import 'package:posts_task/layers/domain/models/posts_model.dart';
import 'package:posts_task/layers/domain/repository/app_repository.dart';

class PostsUseCase {
  PostsUseCase({
    required AppRepository repository,
  }) : _repository = repository;

  final AppRepository _repository;

  Future<Either<Failure, List<Posts>>> call(Map<String, dynamic> params) async {
    return _repository.getPostsData(params);
  }
}
