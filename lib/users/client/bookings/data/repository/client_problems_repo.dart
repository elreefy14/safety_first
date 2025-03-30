import 'package:safety_frist/core/cache/shared_pref_helper.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/networking/api_result.dart';
import 'package:safety_frist/users/client/bookings/data/services/client_problems_service.dart';
import 'package:safety_frist/users/client/bookings/data/models/problem_response_model.dart';

class ClientProblemsRepo {
  final ClientProblemsService _clientProblemsService;

  ClientProblemsRepo(this._clientProblemsService);

  Future<ApiResult<List<ProblemResponseModel>>> getClientProblems() async {
    try {
      var token = CacheHelper.getData(key: 'token');

      final result = await _clientProblemsService.getClientProblems(
        "Bearer $token",
      );

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }
}
