import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/client/home/data/model/notification_topic_request_body.dart';

part 'problem_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProblemService {
  factory ProblemService(Dio dio, {String baseUrl}) = _ProblemService;

  @POST(ApiConstants.addProblem)
  @MultiPart()
  Future<void> createProblem(
    @Header('Authorization') String userToken,
    @Body() FormData formData,
  );

  @GET(ApiConstants.clientProblems)
  Future<List<ProblemResponseModel>> getClientProblems(
    @Header('Authorization') String userToken,
  );

  @GET(ApiConstants.getAllProblemType)
  Future<List<ProblemTypeResponseModel>> getAllProblemTypes(
    @Header('Authorization') String userToken,
  );
  @POST(ApiConstants.sendNotificationToUser)
  Future<HttpResponse> sendNotificationToEngineers(
    @Body() NotificationTopicRequestBody notificationTopicRequestBody,
    @Header("Authorization") String bearerToken,
  );
}
