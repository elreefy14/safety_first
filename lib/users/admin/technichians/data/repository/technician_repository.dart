import 'package:flutter/material.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/admin/technichians/data/models/add_technician_request_body.dart';
import 'package:safety_frist/users/admin/technichians/data/models/technician_response_model.dart';
import 'package:safety_frist/users/admin/technichians/data/services/technician_service.dart';

class TechnicianRepository {
  final TechnicianService _service;

  TechnicianRepository(this._service);

  var token = CacheHelper.getSecuredData(key: CacheHelperKeys.accessToken);

  Future<ApiResult<void>> addTechnician(
    AddTechnicianRequestBody technician,
  ) async {
    try {
      final response = await _service.addTechnician(
        "Bearer $token",
        technician,
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

  Future<ApiResult<void>> deleteTechnician(String id) async {
    try {
      final response = await _service.deleteTechnician("Bearer $token", id);

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<void>> updateTechnician(
    AddTechnicianRequestBody technician,
    String id,
  ) async {
    try {
      final response = await _service.updateTechnician(
        "Bearer $token",
        id,
        technician,
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

  Future<ApiResult<TechnicianResponseModel>> getTechnician(String id) async {
    try {
      final response = await _service.getTechnician("Bearer $token", id);

      return ApiResult.success(response);
    } catch (error) {
      showToast(
        msg: ApiErrorHandler.handleError(error).message,
        color: Colors.red,
      );
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<List<TechnicianResponseModel>>> getAllTechnicians() async {
    try {
      final response = await _service.getAllTechnicians("Bearer $token");

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
