import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

part 'engineer_problems_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EngineerProblemsServices {
  factory EngineerProblemsServices(Dio dio, {String baseUrl}) =
      _EngineerProblemsServices;

  @GET(ApiConstants.getAllProblems)
  Future<List<ProblemResponseModel>> getAllProblems(
    @Header('Authorization') String userToken,
  );

  @GET(ApiConstants.getProblemById)
  Future<ProblemResponseModel> getProblemById(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );

  @GET(ApiConstants.getProblemByStatus)
  Future<List<ProblemResponseModel>> getProblemByStatus(
    @Header('Authorization') String userToken,
    @Path("id") int id,
  );

  @PUT(ApiConstants.assignProblemToTechnician)
  Future<void> assignProblemToTechnician(
    @Header('Authorization') String userToken,
    @Path("problemId") String problemId,
    @Path("technicianId") String technicianId,
  );
}
