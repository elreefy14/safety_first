import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import 'package:safety_frist/users/admin/technichians/data/models/add_technician_request_body.dart';
import 'package:safety_frist/users/admin/technichians/data/models/technician_response_model.dart';

part 'technician_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class TechnicianService {
  factory TechnicianService(Dio dio, {String? baseUrl}) = _TechnicianService;

  @POST(ApiConstants.addTechnician)
  Future<void> addTechnician(
    @Header('Authorization') String userToken,
    @Body() AddTechnicianRequestBody addTechnicianRequestBody,
  );

  @PUT(ApiConstants.updateTechnician)
  Future<void> updateTechnician(
    @Header('Authorization') String userToken,
    @Path("id") String id,
    @Body() AddTechnicianRequestBody addTechnicianRequestBody,
  );

  @DELETE(ApiConstants.deleteTechnician)
  Future<void> deleteTechnician(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );

  @GET(ApiConstants.getTechnician)
  Future<TechnicianResponseModel> getTechnician(
    @Header('Authorization') String userToken,
    @Path("id") String id,
  );

  @GET(ApiConstants.getAllTechnicians)
  Future<List<TechnicianResponseModel>> getAllTechnicians(
    @Header('Authorization') String userToken,
  );
}
