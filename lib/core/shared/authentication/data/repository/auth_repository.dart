import 'package:safety_frist/core/networking/api_error_model.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/authentication/data/models/client_register_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/services/auth_service.dart';

class AuthRepository {
  final AuthServices _authServices;

  AuthRepository(this._authServices);

  Future<ApiResult<LoginResponseModel>> loginWithEmailPassword(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final result = await _authServices.loginWithEmailPassword(
        loginRequestBody,
      );

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorModel(message: error.toString()));
    }
  }

  Future<ApiResult<LoginResponseModel>> registerWithEmailPassword(
    ClientRegisterRequestBody registerRequestBody,
  ) async {
    try {
      final result = await _authServices.registerWithEmailPassword(
        registerRequestBody,
      );
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorModel(message: error.toString()));
    }
  }
}
