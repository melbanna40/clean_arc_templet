import 'package:dio/dio.dart';
import 'package:posts_app/layers/data/dto/posts_dto.dart';
import 'package:posts_app/layers/data/source/remote/app_endpoints.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: AppEndPoints.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET(AppEndPoints.post)
  Future<PostsDto> getPostsApiCall(
    @Queries() Map<String, dynamic> params,
  );
}
