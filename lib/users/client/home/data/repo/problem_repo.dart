import 'dart:io';

import 'package:dio/dio.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/core/services/notification/firebase_notifications_service.dart';
import 'package:safety_frist/users/admin/bookings/data/models/problem_type_response_model.dart';
import 'package:safety_frist/users/client/home/data/model/notification_topic_request_body.dart';
import 'package:safety_frist/users/client/home/data/model/problem_model.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';
import 'package:safety_frist/users/client/home/data/service/problem_service.dart';

class ProblemRepository {
  final ProblemService _problemService;
  final FirebaseNotificationsService _notificationsService;

  ProblemRepository(this._problemService, this._notificationsService);

  Future<ApiResult<void>> createProblem(
    ProblemModel problemModel,
    MultipartFile imageFile,
  ) async {
    try {
      var token = await CacheHelper.getSecuredData(key: 'token');

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
      var token = await CacheHelper.getSecuredData(key: 'token');
      final result = await _problemService.getClientProblems(token);

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<List<ProblemTypeResponseModel>>> getAllProblemTypes() async {
    try {
      var token = await CacheHelper.getSecuredData(key: 'token');
      final response = await _problemService.getAllProblemTypes(
        "Bearer $token",
      );

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }

  Future<ApiResult<HttpResponse>> sendNotificationToAdmins({
    required NotificationBody notificationBody,
  }) async {
    try {
      var bearerToken = await CacheHelper.getSecuredData(
        key: CacheHelperKeys.notificationAccessToken,
      );
      final response = await _notificationsService
          .sendNotificationToEngineerFailure(
            NotificationTopicRequestBody(
              message: MessageBody(
                topic: 'Engineers',
                notification: notificationBody,
              ),
            ),
            'bearer $bearerToken',
          );

      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handleError(error).message);
    }
  }
}
