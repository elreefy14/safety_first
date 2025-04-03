import 'package:dio/dio.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/networking/api_client.dart';
import 'package:safety_frist/users/admin/technichians/data/repository/engineer_repository.dart';
import 'package:safety_frist/users/admin/technichians/data/repository/technician_repository.dart';
import 'package:safety_frist/users/admin/technichians/data/services/engineer_service.dart';
import 'package:safety_frist/users/admin/technichians/data/services/technician_service.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/engineer/engineer_cubit.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_cubit.dart';

Future<void> technicianDependency() async {
  Dio dio = ApiClient.getDio();

  // Engineer
  getIt.registerLazySingleton<EngineerService>(() => EngineerService(dio));

  getIt.registerLazySingleton<EngineerRepository>(
    () => EngineerRepository(getIt()),
  );

  getIt.registerFactory<EngineerCubit>(() => EngineerCubit(getIt()));

  // Technician
  getIt.registerLazySingleton<TechnicianService>(() => TechnicianService(dio));

  getIt.registerLazySingleton<TechnicianRepository>(
    () => TechnicianRepository(getIt()),
  );

  getIt.registerFactory<TechnicianCubit>(() => TechnicianCubit(getIt()));
}
