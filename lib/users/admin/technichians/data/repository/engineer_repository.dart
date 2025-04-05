import 'package:flutter/material.dart';
import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/technichians/data/models/add_engineer_request_body.dart';
import 'package:safety_frist/users/admin/technichians/data/models/engineer_response_model.dart';
import 'package:safety_frist/users/admin/technichians/data/services/engineer_service.dart';

class EngineerRepository {
  final EngineerService _service;

  EngineerRepository(this._service);

  var token = CacheHelper.getData(key: 'token');

  Future<ApiResult<void>> addEngineer(AddEngineerRequestBody engineer) async {
    try {
      final response = await _service.addEngineer("Bearer $token", engineer);

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> deleteEngineer(String id) async {
    try {
      final response = await _service.deleteEngineer("Bearer $token", id);

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> updateEngineer(
    AddEngineerRequestBody engineer,
    String id,
  ) async {
    try {
      final response = await _service.updateEngineer(
        "Bearer $token",
        id,
        engineer,
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

  Future<ApiResult<EngineerResponseModel>> getEngineer(String id) async {
    try {
      final response = await _service.getEngineer("Bearer $token", id);

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<List<EngineerResponseModel>>> getAllEngineers() async {
    try {
      final response = await _service.getAllEngineers("Bearer $token");

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
