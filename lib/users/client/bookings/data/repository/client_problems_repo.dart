import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/tech/data/models/update_problem_request_body.dart';
import 'package:safety_frist/users/client/bookings/data/services/client_problems_service.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

class ClientProblemsRepo {
  final ClientProblemsService _clientProblemsService;

  ClientProblemsRepo(this._clientProblemsService);

  var token = CacheHelper.getSecuredData(key: CacheHelperKeys.accessToken);

  Future<ApiResult<List<ProblemResponseModel>>> getClientProblems() async {
    try {
      final result = await _clientProblemsService.getClientProblems(
        "Bearer $token",
      );

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<ProblemResponseModel>> getProblemById(
    String problemId,
  ) async {
    try {
      final response = await _clientProblemsService.getProblemById(
        "Bearer $token",
        problemId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> updateProblem(
    String problemId,
    UpdateProblemRequestBody updateProblem,
  ) async {
    try {
      final response = await _clientProblemsService.updateProblem(
        "Bearer $token",
        problemId,
        updateProblem,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> deleteProblem(String problemId) async {
    try {
      final response = await _clientProblemsService.deleteProblem(
        "Bearer $token",
        problemId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }
}
