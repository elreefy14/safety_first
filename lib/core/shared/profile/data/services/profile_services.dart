import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/core/shared/profile/data/models/logout_response_model.dart';
import 'package:safety_frist/core/shared/profile/data/models/profile_response_model.dart';

part 'profile_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProfileServices {
  factory ProfileServices(Dio dio, {String baseUrl}) = _ProfileServices;

  @GET(ApiConstants.getProfile)
  Future<ProfileResponseModel> getProfileData(
    @Header('Authorization') String userToken,
  );

  @POST(ApiConstants.logout)
  Future<LogoutResponseModel> logoutUser(
    @Header('Authorization') String userToken,
  );

  @DELETE(ApiConstants.deleteClient)
  Future<void> deleteClient(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );
}
