import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/bookings/data/services/engineer_problems_services.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

class EngineerProblemsRepository {
  final EngineerProblemsServices _services;

  EngineerProblemsRepository(this._services);

  var token = CacheHelper.getData(key: 'token');

  Future<ApiResult<List<ProblemResponseModel>>> getAllProblems() async {
    try {
      final response = await _services.getAllProblems("Bearer $token");

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }

  Future<ApiResult<ProblemResponseModel>> getProblemById(
    String problemId,
  ) async {
    try {
      final response = await _services.getProblemById(
        "Bearer $token",
        problemId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }

  Future<ApiResult<List<ProblemResponseModel>>> getProblemByStatus(
    int statusId,
  ) async {
    try {
      final response = await _services.getProblemByStatus(
        "Bearer $token",
        statusId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }

  Future<ApiResult<void>> assignProblemToTechnician(
    String problemId,
    String technicianId,
  ) async {
    try {
      final response = await _services.assignProblemToTechnician(
        "Bearer $token",
        problemId,
        technicianId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }
}
