import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:posts_app/core/di/injector.dart';
import 'package:posts_app/core/log.dart';
import 'package:posts_app/layers/data/source/local/local_storage.dart';
import 'package:posts_app/layers/data/source/remote/app_endpoints.dart';

const String applicationJson = 'application/json';
const String contentType = 'content-type';
const String accept = 'accept';
// const String AUTHORIZATION = 'Authorization';
const String authorization = 'Authorization';
const String defaultLanguage = 'locale';
const String appId = 'app-id';

class DioFactory {
  DioFactory(this._localStorage);

  final LocalStorage _localStorage;

  Future<Dio> getDio() async {
    final dio = Dio();

    final token = await _localStorage.getToken() ?? '';
    // final language = await _localStorage.getAppLanguage();
    final headers = <String, String>{
      // CONTENT_TYPE: APPLICATION_JSON,
      // ACCEPT: APPLICATION_JSON,
      authorization: 'Bearer $token',
      appId: '65f192f7e5c046f8c9037588',
      // defaultLanguage: language,
    };

    dio.options = BaseOptions(
      baseUrl: AppEndPoints.baseUrl,
      headers: headers,
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
    );

    dio.interceptors.add(LoggingInterceptor());

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient()
          ..badCertificateCallback = (cert, host, port) => true;
        return client;
      },
    );

    return dio;
  }
}

class LoggingInterceptor extends Interceptor {
  DateTime? startTime;
  DateTime? endTime;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    startTime = DateTime.now();
    final localStorage = getIt<LocalStorage>();

    // Get the token from shared preferences.
    final token = await localStorage.getToken() ?? '';
    // Get the language from shared preferences.
    // final lang = await localStorage.getAppLanguage();

    // Update the token and lang in the headers.
    options.headers[authorization] = 'Bearer $token';
    // options.headers[defaultLanguage] = lang;
    options.headers[accept] = 'application/json';

    Log.debug('----------Request Start---------');
    Log.information(' path :${options.path}');

    ///print full path request
    if (options.queryParameters.isEmpty) {
      if (options.path.contains(options.baseUrl)) {
        Log.information('RequestUrl:${options.path}');
      } else {
        Log.information('RequestUrl:${options.baseUrl}${options.path}');
      }
    } else {
      ///If queryParameters is not empty, splice into a complete URl
      Log.information(
        'RequestUrl:${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}',
      );
    }

    Log.warning('RequestMethod:${options.method}');
    Log.warning('RequestHeaders:${options.headers}');
    Log.warning('RequestContentType:${options.contentType}');
    Log.warning(
      'RequestDataOptions:${options.data is FormData ? (options.data as FormData).fields.toString() : options.data.toString()}',
    );

    // Continue the request.
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    endTime = DateTime.now();
    //Request duration
    final duration = endTime!.difference(startTime!).inMilliseconds;
    Log.information(
      '---------- Response Data $response End Request ${response.realUri} in $duration millisecond---------',
    );

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Log.error('--------------Error-----------');
    Log.error(
      '${err.response}${err.message}\n${err.response?.realUri.toString() ?? '$err'}',
    );
    super.onError(err, handler);
  }
}
