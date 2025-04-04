import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/client/bookings/data/models/update_problem_request_body.dart';

part 'client_problems_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ClientProblemsService {
  factory ClientProblemsService(Dio dio, {String baseUrl}) =
      _ClientProblemsService;

  @GET(ApiConstants.clientProblems)
  Future<List<ProblemResponseModel>> getClientProblems(
    @Header('Authorization') String userToken,
  );

  @GET(ApiConstants.getProblemById)
  Future<ProblemResponseModel> getProblemById(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );

  @DELETE(ApiConstants.deleteProblem)
  Future<void> deleteProblem(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );

  @DELETE(ApiConstants.updateProblem)
  Future<void> updateProblem(
    @Header('Authorization') String userToken,
    @Path("id") String id,
    @Body() UpdateProblemRequestBody updateProblemRequestBody,
  );
}
