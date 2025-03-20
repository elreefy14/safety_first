import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/auth_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/client_register_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/login_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/services/auth_service.dart';

class AuthRepository {
  final AuthServices _authServices;

  AuthRepository(this._authServices);

  Future<ApiResult<AuthResponseModel>> loginWithEmailPassword(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final result = await _authServices.loginWithEmailPassword(
        loginRequestBody,
      );

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }

  Future<ApiResult<AuthResponseModel>> registerWithEmailPassword(
    ClientRegisterRequestBody registerRequestBody,
  ) async {
    try {
      final result = await _authServices.registerWithEmailPassword(
        registerRequestBody,
      );
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }
}
