import 'package:flutter/material.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_request_body.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';
import 'package:safety_frist/users/admin/bookings/data/services/engineer_problem_types_service.dart';

class EngineerProblemTypeRepository {
  final EngineerProblemTypesService _service;

  EngineerProblemTypeRepository(this._service);

  var token = CacheHelper.getSecuredData(key: CacheHelperKeys.accessToken);

  Future<ApiResult<void>> addProblemType(
    ProblemTypeRequestBody problemType,
  ) async {
    try {
      final response = await _service.addProblemType(
        "Bearer $token",
        problemType,
      );

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> updateProblemType(
    ProblemTypeRequestBody problemType,
    String id,
  ) async {
    try {
      final response = await _service.updateProblemType(
        "Bearer $token",
        id,
        problemType,
      );

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> deleteProblemType(String id) async {
    try {
      final response = await _service.deleteProblemType("Bearer $token", id);

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<ProblemTypeResponseModel>> getProblemTypesById(
    String id,
  ) async {
    try {
      final response = await _service.getProblemTypesById("Bearer $token", id);

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<List<ProblemTypeResponseModel>>> getAllProblemTypes() async {
    try {
      final response = await _service.getAllProblemTypes("Bearer $token");

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }
}
