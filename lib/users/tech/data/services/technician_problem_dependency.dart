import 'package:dio/dio.dart';
import 'package:safety_frist/core/networking/api_client.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'package:safety_frist/users/tech/data/repo/technician_problems_repository.dart';
import 'package:safety_frist/users/tech/data/services/technician_problems_services.dart';
import 'package:safety_frist/users/tech/presentation/logic/technician_problems_cubit.dart';

Future<void> technicianProblemsDependency() async {
  Dio dio = ApiClient.getDio();

  getIt.registerLazySingleton<TechnicianProblemsServices>(
    () => TechnicianProblemsServices(dio),
  );
  getIt.registerLazySingleton<TechnicianProblemsRepository>(
    () => TechnicianProblemsRepository(getIt()),
  );

  getIt.registerFactory<TechnicianProblemsCubit>(
    () => TechnicianProblemsCubit(getIt()),
  );
}
