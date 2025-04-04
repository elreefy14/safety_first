import 'package:dio/dio.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/networking/api_client.dart';
import 'package:safety_frist/users/admin/bookings/data/repository/engineer_problems_repository.dart';
import 'package:safety_frist/users/admin/bookings/data/services/engineer_problems_services.dart';
import 'package:safety_frist/users/admin/bookings/presentation/logic/engineer_problems_cubit.dart';

Future<void> engineerProblemsDependency() async {
  Dio dio = ApiClient.getDio();

  // Engineer
  getIt.registerLazySingleton<EngineerProblemsServices>(
    () => EngineerProblemsServices(dio),
  );

  getIt.registerLazySingleton<EngineerProblemsRepository>(
    () => EngineerProblemsRepository(getIt()),
  );

  getIt.registerFactory<EngineerProblemsCubit>(
    () => EngineerProblemsCubit(getIt()),
  );
}
