import 'package:dio/dio.dart';
import 'package:safety_frist/users/client/home/data/repo/problem_repo.dart';
import 'package:safety_frist/users/client/home/data/service/problem_service.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_cubit.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';

import '../../../../../core/networking/api_client.dart';

Future<void> problemDependency() async {
  Dio dio = ApiClient.getDio();

  getIt.registerLazySingleton<ProblemService>(() => ProblemService(dio));
  getIt.registerLazySingleton<ProblemRepository>(() => ProblemRepository(getIt()));

  getIt.registerFactory<ProblemCubit>(() => ProblemCubit(getIt()));
}
