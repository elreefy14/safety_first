import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/core/shared/authentication/data/models/client_register_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login_request_body.dart';
import 'package:safety_frist/core/shared/authentication/data/models/login_response_model.dart';
import 'package:safety_frist/core/shared/authentication/data/models/refresh_token_request.dart';
import 'package:safety_frist/core/shared/authentication/data/models/refresh_token_response.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthServices {
  factory AuthServices(Dio dio, {String baseUrl}) = _AuthServices;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> loginWithEmailPassword(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.clientRegister)
  Future<LoginResponseModel> registerWithEmailPassword(
    @Body() ClientRegisterRequestBody clientRegisterRequestBody,
  );

  @POST(ApiConstants.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequest request,
  );
}
