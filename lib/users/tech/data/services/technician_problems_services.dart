import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/tech/data/models/update_problem_request_body.dart';

part 'technician_problems_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class TechnicianProblemsServices {
  factory TechnicianProblemsServices(Dio dio, {String baseUrl}) =
      _TechnicianProblemsServices;

  @GET(ApiConstants.technicianProblems)
  Future<List<ProblemResponseModel>> getTechnicianProblems(
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

  @PUT(ApiConstants.updateProblem)
  Future<void> updateProblem(
    @Header('Authorization') String userToken,
    @Path("id") String id,
    @Body() UpdateProblemRequestBody updateProblemRequestBody,
  );

  @PUT(ApiConstants.updateProblemImage)
  @MultiPart()
  Future<void> updateProblemImage(
    @Header('Authorization') String userToken,
    @Path("id") String id,
    @Body() FormData formData,
  );

  @PUT(ApiConstants.updateProblemStatus)
  Future<void> updateProblemStatus(
    @Header('Authorization') String userToken,
    @Path("id") String id,
    @Query("status") int status,
  );
}
