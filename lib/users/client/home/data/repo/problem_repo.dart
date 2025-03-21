import 'package:dio/dio.dart';
import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_error_model.dart';
import '../../../../../core/networking/api_result.dart';
import '../model/problem_model.dart';
import '../service/problem_service.dart';
import 'package:safety_frist/core/shared/authentication/data/services/auth_service.dart';

class ProblemRepository {
  final ProblemService problemService;

  ProblemRepository(this.problemService);

  Future<ApiResult<ProblemModel>> createProblem(ProblemModel problemModel, MultipartFile imageFile) async {
    try {
      var token=CacheHelper.getData(key: 'token');
      FormData formData = FormData.fromMap({
        "description": problemModel.description,
        "type": problemModel.type,
        "image": imageFile,
      });


      final result = await problemService.createProblem("Bearer $token", formData);
      return ApiResult.success(result);
    } catch (error) {
      print( error.toString());
      return ApiResult.failure(ApiErrorHandler());

    }
  }
}
