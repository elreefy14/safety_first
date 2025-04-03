import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/admin/technichians/data/models/add_engineer_request_body.dart';
import 'package:safety_frist/users/admin/technichians/data/models/engineer_response_model.dart';

part 'engineer_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EngineerService {
  factory EngineerService(Dio dio, {String? baseUrl}) = _EngineerService;

  @POST(ApiConstants.addEngineer)
  Future<void> addEngineer(
    @Header('Authorization') String userToken,
    @Body() AddEngineerRequestBody addEngineerRequestBody,
  );

  @PUT(ApiConstants.updateEngineer)
  Future<void> updateEngineer(
    @Header('Authorization') String userToken,
    @Path("id") String id,
    @Body() AddEngineerRequestBody addEngineerRequestBody,
  );

  @DELETE(ApiConstants.deleteEngineer)
  Future<void> deleteEngineer(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );

  @GET(ApiConstants.getEngineer)
  Future<EngineerResponseModel> getEngineer(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );

  @GET(ApiConstants.getAllEngineers)
  Future<List<EngineerResponseModel>> getAllEngineers(
    @Header('Authorization') String userToken,
  );
}
