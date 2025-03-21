import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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

  void setupSuccess(BuildContext context) {
    if (userType == UserType.client) {
      context.pushReplacement(Routes.clientBottomNavBar);

      showToast(msg: 'تم تسجيل الدخول بنجاح', color: Colors.green);
    } else if (userType == UserType.admin) {
      context.pushReplacement(Routes.adminBottomNavBar);
    } else {
      context.pushReplacement(Routes.technichianBottomNavBar);
    }
  }
}