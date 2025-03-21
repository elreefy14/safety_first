import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';

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
}
