import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/data/models/user_type_model.dart';
import 'package:safety_frist/core/shared/authentication/presentation/logic/login/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({
    super.key,
    required this.child,
    required this.userType,
  });

  final Widget child;
  final UserType userType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: BlocListener<LoginCubit, LoginState>(
        child: child,
        listener: (context, state) {
          switch (state) {
            case LoginSuccessState():
              setupSuccess(context);
            default:
          }
        },
      ),
    );
  }

  void setupSuccess(BuildContext context) async {
    // FirebaseMessaging messaging = FirebaseMessaging.instance;

    if (LoginCubit.get(context).userRole == 'ClientRole') {
      context.pushReplacement(Routes.clientBottomNavBar);
      CacheHelper.saveData(
        key: CacheHelperKeys.login,
        value: Routes.clientBottomNavBar,
      );
    } else if (LoginCubit.get(context).userRole == 'EngineerRole') {
      context.pushReplacement(Routes.adminBottomNavBar);
      CacheHelper.saveData(
        key: CacheHelperKeys.login,
        value: Routes.adminBottomNavBar,
      );
      // await messaging.subscribeToTopic('Engineers').then((value) {});
    } else if (LoginCubit.get(context).userRole == 'TechnicianRole') {
      context.pushReplacement(Routes.technicianBottomNavBar);
      CacheHelper.saveData(
        key: CacheHelperKeys.login,
        value: Routes.technicianBottomNavBar,
      );
    }
    showToast(msg: 'تم تسجيل إلي حسابك الدخول بنجاح', color: Colors.green);
  }
}
