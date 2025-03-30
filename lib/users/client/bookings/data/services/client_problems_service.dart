import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

part 'client_problems_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ClientProblemsService {
  factory ClientProblemsService(Dio dio, {String baseUrl}) =
      _ClientProblemsService;

  @GET(ApiConstants.clientProblems)
  Future<List<ProblemResponseModel>> getClientProblems(
    @Header('Authorization') String userToken,
  );
}
