import 'package:dio/dio.dart';
import 'package:safety_frist/core/networking/api_client.dart';
import 'package:safety_frist/users/client/bookings/data/repository/client_problems_repo.dart';
import 'package:safety_frist/users/client/bookings/data/services/client_problems_service.dart';
import 'package:safety_frist/users/client/bookings/presentation/logic/client_problems_cubit.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';

Future<void> clientProblemsDependency() async {
  Dio dio = ApiClient.getDio();

  getIt.registerLazySingleton<ClientProblemsService>(
    () => ClientProblemsService(dio),
  );
  getIt.registerLazySingleton<ClientProblemsRepo>(
    () => ClientProblemsRepo(getIt()),
  );

  getIt.registerFactory<ClientProblemsCubit>(
    () => ClientProblemsCubit(getIt()),
  );
}
