import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/auth_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/client_register_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/login_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/auth/refresh_token_request.dart';
import 'package:safety_frist/core/shared/authentication/data/models/forgot%20password/forgot_password_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/forgot%20password/reset_password_request_body.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio, {String? baseUrl}) = _AuthServices;

  @POST(ApiConstants.login)
  Future<AuthResponseModel> loginWithEmailPassword(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.clientRegister)
  Future<AuthResponseModel> registerWithEmailPassword(
    @Body() ClientRegisterRequestBody clientRegisterRequestBody,
  );

  @POST(ApiConstants.confirmEmail)
  Future<void> confirmEmail(
    @Query("Email") String email,
    @Query("Token") String token,
  );

  @POST(ApiConstants.forgotPassword)
  Future<void> forgotPassword(@Body() ForgotPasswordRequestBody email);

  @POST(ApiConstants.resetPassword)
  Future<void> resetPassword(
    @Body() ResetPasswordRequestBody resetPasswordRequestBody,
  );

  @GET(ApiConstants.refreshToken)
  Future<AuthResponseModel> refreshToken(
    @Body() RefreshTokenRequest refreshTokenRequest,
  );
}
