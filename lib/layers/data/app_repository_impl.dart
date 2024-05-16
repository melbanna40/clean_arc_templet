import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:posts_app/core/network_info.dart';
import 'package:posts_app/layers/data/dto/posts_dto.dart';
import 'package:posts_app/layers/data/source/local/local_storage.dart';
import 'package:posts_app/layers/data/source/remote/app_api.dart';
import 'package:posts_app/layers/data/source/remote/failure/error_handler.dart';
import 'package:posts_app/layers/data/source/remote/failure/failure.dart';
import 'package:posts_app/layers/domain/repository/app_repository.dart';

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
  Future<Either<Failure, List<PostsDataDto?>?>> getPostsData(
    Map<String, dynamic> params,
  ) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _api.getPostsApiCall(params);

        if (response.data != null && response.data!.isNotEmpty) {
          // await _localStorage.setPostsList(res);
          return Right(response.data);
        } else {
          // failure --return business error
          // return either left
          return Left(
            Failure(
              ApiInternalStatus.failure,
              /*response.message ??*/ ResponseMessage.defaultError,
            ),
          );
        }
      } catch (error, stack) {
        log('$error\n$stack');
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      // final postsList = await _localStorage.getPostsList();
      // if (postsList!.isNotEmpty) {
      //   return Right(postsList);
      // } else {
      return Left(DataSource.noInternetError.getFailure());
      // }
    }
  }
}
