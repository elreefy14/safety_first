import 'package:dio/dio.dart';
import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/tech/data/models/update_problem_request_body.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/tech/data/services/technician_problems_services.dart';

class TechnicianProblemsRepository {
  final TechnicianProblemsServices _services;

  TechnicianProblemsRepository(this._services);

  var token = CacheHelper.getData(key: 'token');

  Future<ApiResult<List<ProblemResponseModel>>> getTechnicianProblems() async {
    try {
      final result = await _services.getTechnicianProblems("Bearer $token");

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
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
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> updateProblem(
    String problemId,
    UpdateProblemRequestBody updateProblem,
  ) async {
    try {
      final response = await _services.updateProblem(
        "Bearer $token",
        problemId,
        updateProblem,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> updateProblemStatus(
    String problemId,
    int status,
  ) async {
    try {
      final response = await _services.updateProblemStatus(
        "Bearer $token",
        problemId,
        status,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> updateProblemImage(
    String problemId,
    MultipartFile imageFile,
  ) async {
    try {
      final FormData formData = FormData.fromMap({"Image": imageFile});

      final response = await _services.updateProblemImage(
        "Bearer $token",
        problemId,
        formData,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> deleteProblem(String problemId) async {
    try {
      final response = await _services.deleteProblem(
        "Bearer $token",
        problemId,
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }
}
