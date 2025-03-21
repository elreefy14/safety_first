import 'package:dio/dio.dart';
import 'package:safety_frist/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return ApiErrorModel(
        statusCode: 500,
        message: 'An unexpected error occurred.',
      );
    }
  }

  static ApiErrorModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
          statusCode: 408,
          message: 'Request timeout. Please check your internet connection.',
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response!);
      case DioExceptionType.cancel:
        return ApiErrorModel(
          statusCode: 499,
          message: 'Request was cancelled.',
        );
      case DioExceptionType.unknown:
        if (error.message!.contains('SocketException')) {
          return ApiErrorModel(
            statusCode: 503,
            message: 'No internet connection. Please check your network.',
          );
        } else {
          return ApiErrorModel(
            statusCode: 500,
            message: 'An unknown error occurred.',
          );
        }
      default:
        return ApiErrorModel(
          statusCode: 500,
          message: 'An unexpected error occurred.',
        );
    }
  }

  static ApiErrorModel _handleBadResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        return ApiErrorModel(
          statusCode: 400,
          message: 'Bad request. Please check your input.',
        );
      case 401:
        return ApiErrorModel(
          statusCode: 401,
          message: 'Unauthorized. Please login again.',
        );
      case 403:
        return ApiErrorModel(
          statusCode: 403,
          message: 'Forbidden. You do not have permission.',
        );
      case 404:
        return ApiErrorModel(statusCode: 404, message: 'Resource not found.');
      case 500:
        return ApiErrorModel(
          statusCode: 500,
          message: 'Internal server error. Please try again later.',
        );
      case 503:
        return ApiErrorModel(
          statusCode: 503,
          message: 'Service unavailable. Please try again later.',
        );
      default:
        return ApiErrorModel(
          statusCode: response.statusCode ?? 500,
          message: 'An error occurred while processing the response.',
        );
    }
  }
}
