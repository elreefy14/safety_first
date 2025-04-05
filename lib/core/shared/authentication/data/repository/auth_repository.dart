import 'package:flutter/material.dart';
import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login/auth_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/register/client_register_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login/login_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/forgot%20password/forgot_password_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/forgot%20password/reset_password_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/register/resend_otp_confirm_email_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/services/auth_service.dart';

class AuthRepository {
  final AuthServices _authServices;

  AuthRepository(this._authServices);

  var token = CacheHelper.getData(key: 'token');
  var email = CacheHelper.getData(key: 'email');

  Future<ApiResult<AuthResponseModel>> loginWithEmailPassword(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final result = await _authServices.loginWithEmailPassword(
        loginRequestBody,
      );

      return ApiResult.success(result);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
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
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> confirmEmail(String otpCode) async {
    try {
      final result = await _authServices.confirmEmail(email, otpCode);
      return ApiResult.success(result);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> resendOtpConfirmEmail() async {
    try {
      final result = await _authServices.resendOtpConfirmEmail(
        ResendOptConfirmEmailRequestBody(email: email),
      );
      return ApiResult.success(result);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> forgotPassword(
    ForgotPasswordRequestBody email,
  ) async {
    try {
      final result = await _authServices.forgotPassword(email);
      return ApiResult.success(result);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> resendOtpResetPassword(
    ForgotPasswordRequestBody email,
  ) async {
    try {
      final result = await _authServices.resendOtpResetPassword(email);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> resetPassword({
    required String otpCode,
    required String newPassword,
  }) async {
    try {
      final result = await _authServices.resetPassword(
        ResetPasswordRequestBody(
          email: email,
          otp: otpCode,
          newPassword: newPassword,
        ),
      );
      return ApiResult.success(result);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }
}
