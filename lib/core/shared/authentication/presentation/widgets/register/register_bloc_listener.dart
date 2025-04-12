import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/presentation/logic/register/register_cubit.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt()),
      child: BlocListener<RegisterCubit, RegisterState>(
        child: child,
        listener: (context, state) {
          switch (state) {
            case RegisterSuccessState():
              showToast(
                msg: 'بالرجاء قم بفحص الايميل لتأكيد الأكونت',
                color: Colors.green,
              );
              context.pushReplacement(Routes.verifyEmailScreen);

            default:
          }
        },
      ),
    );
  }

  void setupError(BuildContext context, error) {
    showToast(
      msg: ApiErrorHandler.handleError(error).message,
      color: Colors.red,
    );
  }
}
