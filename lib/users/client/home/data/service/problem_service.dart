import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:safety_frist/core/networking/api_constants.dart';
import '../model/problem_model.dart';

part 'problem_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProblemService {
  factory ProblemService(Dio dio, {String baseUrl}) = _ProblemService;

  @POST(ApiConstants.addProblem)
  @MultiPart()
  Future<ProblemModel> createProblem(
      @Header('Authorization') String userToken,
      @Body() FormData formData,
      );
}
