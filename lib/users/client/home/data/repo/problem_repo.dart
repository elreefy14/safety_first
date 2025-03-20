import 'package:safety_frist/core/networking/api_error_handler.dart';

import '../../../../../core/networking/api_result.dart';
import '../model/problem_model.dart';
import '../service/problem_service.dart';

class ProblemRepository {
  final ProblemService _problemService;

  ProblemRepository(this._problemService);

  Future<ApiResult<ProblemModel>> createProblem(
    ProblemModel problemModel,
  ) async {
    try {
      final result = await _problemService.createProblem(problemModel);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler());
    }
  }
}
