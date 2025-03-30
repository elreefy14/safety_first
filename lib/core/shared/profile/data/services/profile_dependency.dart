import 'package:dio/dio.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'package:safety_frist/core/networking/api_client.dart';
import 'package:safety_frist/core/shared/profile/data/repository/profile_repository.dart';
import 'package:safety_frist/core/shared/profile/data/services/profile_services.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_cubit.dart';

Future<void> profileDependency() async {
  Dio dio = ApiClient.getDio();

  getIt.registerLazySingleton<ProfileServices>(() => ProfileServices(dio));

  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(getIt()),
  );

  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
}
