import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login/auth_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/register/client_register_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login/login_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/forgot%20password/forgot_password_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/forgot%20password/reset_password_request_body.dart';
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

  Future<ApiResult<void>> confirmEmail(String email, String token) async {
    try {
      final result = await _authServices.confirmEmail(email, token);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }

  Future<ApiResult<void>> forgotPassword(
    ForgotPasswordRequestBody email,
  ) async {
    try {
      final result = await _authServices.forgotPassword(email);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }

  Future<ApiResult<void>> resetPassword(
    ResetPasswordRequestBody resetPasswordRequestBody,
  ) async {
    try {
      final result = await _authServices.resetPassword(
        resetPasswordRequestBody,
      );
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }
}
