import 'package:dio/dio.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/networking/api_client.dart';
import 'package:safety_frist/users/admin/bookings/data/repository/engineer_problem_type_repository.dart';
import 'package:safety_frist/users/admin/bookings/data/repository/engineer_problems_repository.dart';
import 'package:safety_frist/users/admin/bookings/data/services/engineer_problem_types_service.dart';
import 'package:safety_frist/users/admin/bookings/data/services/engineer_problems_services.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problem%20type/problem_type_cubit.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/problems/engineer_problems_cubit.dart';

Future<void> engineerProblemsDependency() async {
  Dio dio = ApiClient.getDio();

  // Engineer Problems
  getIt.registerLazySingleton<EngineerProblemsServices>(
    () => EngineerProblemsServices(dio),
  );

  getIt.registerLazySingleton<EngineerProblemsRepository>(
    () => EngineerProblemsRepository(getIt()),
  );

  getIt.registerFactory<EngineerProblemsCubit>(
    () => EngineerProblemsCubit(getIt()),
  );

  // Engineer Problems Types
  getIt.registerLazySingleton<EngineerProblemTypesService>(
    () => EngineerProblemTypesService(dio),
  );

  getIt.registerLazySingleton<EngineerProblemTypeRepository>(
    () => EngineerProblemTypeRepository(getIt()),
  );

  getIt.registerFactory<ProblemTypeCubit>(() => ProblemTypeCubit(getIt()));
}
