
import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:posts_app/core/log.dart';
import 'package:posts_app/layers/data/source/remote/failure/failure.dart';

class ErrorHandler implements Exception {
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultError.getFailure();
    }
  }

  late Failure failure;
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectionTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
          error.response?.statusCode ?? 0,
          ((error.response?.data as Map)['data'] as Map)['message'] ?? '',
        );
      } else if (error.response?.statusCode == 401) {
        // try {
        //   AutoRouteObserver()
        //       .navigator
        //       ?.pushNamedAndRemoveUntil(LoginRoute.name, (route) => false);
        // } catch (e, s) {
        //   Log.error('$e $s');
        // }
        return DataSource.unauthorized.getFailure();
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.unknown:
      return DataSource.defaultError.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.cacheError.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.getFailure();
  }
}

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetError,
  defaultError,
  blocked
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success.tr());
      case DataSource.noContent:
        return Failure(
          ResponseCode.noContent,
          ResponseMessage.noContent.tr(),
        );
      case DataSource.badRequest:
        return Failure(
          ResponseCode.badRequest,
          ResponseMessage.badRequestError.tr(),
        );
      case DataSource.forbidden:
        return Failure(
          ResponseCode.forbidden,
          ResponseMessage.forbiddenError.tr(),
        );
      case DataSource.unauthorized:
        return Failure(
          ResponseCode.unauthorized,
          ResponseMessage.unauthorizedError.tr(),
        );
      case DataSource.notFound:
        return Failure(
          ResponseCode.notFound,
          ResponseMessage.notFoundError.tr(),
        );
      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError.tr(),
        );
      case DataSource.connectionTimeout:
        return Failure(
          ResponseCode.connectionTimeout,
          ResponseMessage.connectionTimeoutError.tr(),
        );
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.defaultError.tr());
      case DataSource.receiveTimeout:
        return Failure(
          ResponseCode.receiveTimeout,
          ResponseMessage.receiveTimeoutError.tr(),
        );
      case DataSource.sendTimeout:
        return Failure(
          ResponseCode.sendTimeout,
          ResponseMessage.sendTimeoutError.tr(),
        );
      case DataSource.cacheError:
        return Failure(
          ResponseCode.cacheError,
          ResponseMessage.cacheError.tr(),
        );
      case DataSource.noInternetError:
        return Failure(
          ResponseCode.noInternetError,
          ResponseMessage.noInternetError.tr(),
        );
      case DataSource.defaultError:
        return Failure(
          ResponseCode.defaultError,
          ResponseMessage.defaultError.tr(),
        );
      case DataSource.blocked:
        return Failure(ResponseCode.blocked, ResponseMessage.defaultError.tr());
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorized = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found
  static const int blocked = 406; // failure, not found

  // local status code
  static const int connectionTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetError = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String success = 'success'; // success with data
  static const String noContent =
      'no_content'; // success with no data (no content)
  static const String badRequestError =
      'bad_request_error'; // failure, API rejected request
  static const String unauthorizedError =
      'unauthorized_error'; // failure, user is not authorised
  static const String forbiddenError =
      'forbidden_error'; //  failure, API rejected request
  static const String internalServerError =
      'internal_server_error'; // failure, crash in server side
  static const String notFoundError =
      'not_found_error'; // failure, crash in server side

  // local status code
  static const String connectionTimeoutError = 'connectionTimeoutError';
  static const String defaultError = 'defaultError';
  static const String receiveTimeoutError = 'receiveTimeoutError';
  static const String sendTimeoutError = 'sendTimeoutError';
  static const String cacheError = 'cacheError';
  static const String noInternetError = 'noInternetError';
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 402;
}
