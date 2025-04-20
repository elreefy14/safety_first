import 'package:dio/dio.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/services/notification_constants.dart';

class NotificationRepository {
  final _dio = Dio();

  Future<void> refreshToken() async {
    final response = await _dio.post(
      'https://oauth2.googleapis.com/token',
      data: {
        'grant_type': 'refresh_token',
        'client_id': NotificationConstants.clientId,
        'client_secret': NotificationConstants.clientSecret,
        'refresh_token': NotificationConstants.refreshToken,
      },
      options: Options(
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      ),
    );

    if (response.statusCode == 200) {
      final accessToken = response.data['access_token'];
      await CacheHelper.saveSecuredData(
        key: CacheHelperKeys.notificationAccessToken,
        value: accessToken,
      );
    } else {
      throw Exception('Token refresh failed');
    }
  }
}
