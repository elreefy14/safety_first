import 'package:get_it/get_it.dart';
import 'package:safety_frist/core/shared/authentication/data/services/auth_dependency.dart';
import 'package:safety_frist/core/shared/profile/data/services/profile_dependency.dart';
import 'package:safety_frist/users/client/bookings/data/services/client_problems_dependency.dart';
import 'package:safety_frist/users/client/home/data/service/problem_dependency.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await authDependency();
  await problemDependency();
  await clientProblemsDependency();
  await profileDependency();
}
