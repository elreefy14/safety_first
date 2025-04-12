import 'package:dio/dio.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';
import 'package:safety_frist/users/client/home/data/model/problem_model.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/client/home/data/service/problem_service.dart';

class ProblemRepository {
  final ProblemService _problemService;

  ProblemRepository(this._problemService);

  var token = CacheHelper.getSecuredData(key: 'token');

  Future<ApiResult<void>> createProblem(
    ProblemModel problemModel,
    MultipartFile imageFile,
  ) async {
    try {
      final FormData formData = FormData.fromMap({
        "Description": problemModel.description,
        "ProblemTypeId": problemModel.problemTypeId,
        "Image": imageFile,
      });

      final result = await _problemService.createProblem(
        "Bearer $token",
        formData,
      );
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<List<ProblemResponseModel>>> getClientProblems() async {
    try {
      final result = await _problemService.getClientProblems(token);

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<List<ProblemTypeResponseModel>>> getAllProblemTypes() async {
    try {
      final response = await _problemService.getAllProblemTypes(
        "Bearer $token",
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }
}
