import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/client/home/data/model/notification_topic_request_body.dart';

part 'firebase_notifications_service.g.dart';

@RestApi(baseUrl: ApiConstants.notificationBaseUrl)
abstract class FirebaseNotificationsService {
  factory FirebaseNotificationsService(Dio dio, {String baseUrl}) =
      _FirebaseNotificationsService;

  @POST(ApiConstants.sendNotificationToUser)
  Future<HttpResponse> sendNotificationToEngineerFailure(
    @Body() NotificationTopicRequestBody notificationRequestBody,
    @Header("Authorization") String bearerToken,
  );
}
