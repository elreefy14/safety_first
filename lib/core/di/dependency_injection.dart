import 'package:get_it/get_it.dart';
import 'package:safety_frist/core/shared/authentication/data/services/auth_dependency.dart';

import '../../users/client/home/data/service/problem_dependency.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await authDependency();
  await problemDependency();
}
