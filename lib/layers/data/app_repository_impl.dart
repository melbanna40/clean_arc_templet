import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:posts_task/layers/data/source/local/local_storage.dart';
import 'package:posts_task/layers/data/source/remote/app_api.dart';
import 'package:posts_task/layers/data/source/remote/failure/error_handler.dart';
import 'package:posts_task/layers/data/source/remote/failure/failure.dart';
import 'package:posts_task/layers/data/source/remote/network_info.dart';
import 'package:posts_task/layers/domain/adapters/posts/post_obj.dart';
import 'package:posts_task/layers/domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl({
    required AppServiceClient api,
    required LocalStorage localStorage,
    required NetworkInfo networkInfo,
  })  : _api = api,
        _localStorage = localStorage,
        _networkInfo = networkInfo;
  final AppServiceClient _api;
  final LocalStorage _localStorage;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, List<Post>>> getPostsData(
    Map<String, dynamic> params,
  ) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _api.getPostsApiCall(params);

        if (response.data != null && response.data!.isNotEmpty) {
          final res = <Post>[];
          response.data?.forEach((element) {
            res.add(
              Post.fromJson({
                'id': element?.id,
                'likes': element?.likes,
                'tags': element?.tags,
                'text': element?.text,
                'publishDate': element?.publishDate,
                'image': element?.image,
                'owner': element?.owner?.toJson(),
              }),
            );
          });
          await _localStorage.setPostsList(res);
          return Right(res);
        } else {
          // failure --return business error
          // return either left
          return Left(
            Failure(
              ApiInternalStatus.FAILURE,
              /*response.message ??*/ ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error, stack) {
        log('$error\n$stack');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      final postsList = await _localStorage.getPostsList();
      if (postsList!.isNotEmpty) {
        return Right(postsList);
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
}
