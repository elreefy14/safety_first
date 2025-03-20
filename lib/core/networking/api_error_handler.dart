import 'package:dio/dio.dart';
import 'package:safety_frist/core/networking/api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return ApiErrorModel(statusCode: 500, message: 'حدث خطأ غير معروف');
    }
  }

  static ApiErrorModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
          statusCode: 408,
          message: 'يرجى التحقق من اتصالك بالإنترنت',
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response!);
      case DioExceptionType.cancel:
        return ApiErrorModel(statusCode: 499, message: 'تم إلغاء الطلب');
      case DioExceptionType.unknown:
        if (error.message!.contains('SocketException')) {
          return ApiErrorModel(
            statusCode: 503,
            message: 'No internet connection. Please check your network.',
          );
        } else {
          return ApiErrorModel(statusCode: 500, message: 'حدث خطأ غير معروف');
        }
      default:
        return ApiErrorModel(statusCode: 500, message: 'حدث خطأ غير معروف');
    }
  }

  static ApiErrorModel _handleBadResponse(Response response) {
    switch (response.statusCode) {
      case 400:
        return ApiErrorModel(
          statusCode: 400,
          message:
              'الايميل او كلمة المرور غير صحيحه يرجى التأكد من البيانات المدخلة والمحاولة مرة أخرى',
        );
      case 401:
        return ApiErrorModel(
          statusCode: 401,
          message: 'غير مُصرَّح به. يُرجى تسجيل الدخول مرة أخرى.',
        );
      case 403:
        return ApiErrorModel(statusCode: 403, message: 'ممنوع. ليس لديك إذن');
      case 404:
        return ApiErrorModel(
          statusCode: 404,
          message: 'لم يتم العثور على المورد',
        );
      case 500:
        return ApiErrorModel(
          statusCode: 500,
          message: 'خطأ داخلي في الخادم. يُرجى المحاولة لاحقًا',
        );
      case 503:
        return ApiErrorModel(
          statusCode: 503,
          message: 'الخدمة غير متاحة. يُرجى المحاولة لاحقًا.',
        );
      default:
        return ApiErrorModel(
          statusCode: response.statusCode ?? 500,
          message: 'حدث خطأ أثناء معالجة الاستجابة',
        );
    }
  }
}
