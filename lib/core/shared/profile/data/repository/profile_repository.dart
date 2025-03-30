import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/shared/profile/data/models/logout_response_model.dart';
import 'package:safety_frist/core/shared/profile/data/models/profile_response_model.dart';
import 'package:safety_frist/core/shared/profile/data/services/profile_services.dart';

class ProfileRepository {
  final ProfileServices _profileServices;
  ProfileRepository(this._profileServices);

  Future<ApiResult<ProfileResponseModel>> getProfile() async {
    try {
      var token = CacheHelper.getData(key: 'token');
      final result = await _profileServices.getProfileData("Bearer $token");

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }

  Future<ApiResult<LogoutResponseModel>> logoutUser() async {
    try {
      var token = CacheHelper.getData(key: 'token');

      final result = await _profileServices.logoutUser("Bearer $token");

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }
}
