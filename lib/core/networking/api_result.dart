import 'package:safety_frist/core/networking/api_error_handler.dart';

abstract class ApiResult<T> {
  const ApiResult();
  factory ApiResult.success(T data) = Success<T>;
  factory ApiResult.failure(ApiErrorHandler error) = Failure<T>;
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final ApiErrorHandler error;
  const Failure(this.error);
}
