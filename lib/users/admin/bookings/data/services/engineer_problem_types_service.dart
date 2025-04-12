import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_request_body.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';

part 'engineer_problem_types_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EngineerProblemTypesService {
  factory EngineerProblemTypesService(Dio dio, {String baseUrl}) =
      _EngineerProblemTypesService;

  @GET(ApiConstants.getAllProblemType)
  Future<List<ProblemTypeResponseModel>> getAllProblemTypes(
    @Header('Authorization') String userToken,
  );

  @GET(ApiConstants.getProblemType)
  Future<ProblemTypeResponseModel> getProblemTypesById(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );

  @POST(ApiConstants.addProblemType)
  Future<void> addProblemType(
    @Header('Authorization') String userToken,
    @Body() ProblemTypeRequestBody problemTypeRequestBody,
  );

  @PUT(ApiConstants.updateProblemType)
  Future<void> updateProblemType(
    @Header('Authorization') String userToken,
    @Path("id") String id,
    @Body() ProblemTypeRequestBody problemTypeRequestBody,
  );

  @DELETE(ApiConstants.deleteProblemType)
  Future<void> deleteProblemType(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );
}
