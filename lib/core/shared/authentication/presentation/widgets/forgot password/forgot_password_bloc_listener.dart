import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/networking/api_error_handler.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/presentation/logic/forgot%20password/forgot_password_cubit.dart';

class ForgotPasswordBlocListener extends StatelessWidget {
  const ForgotPasswordBlocListener({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgotPasswordCubit>(),
      child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        child: child,
        listener: (context, state) {
          switch (state) {
            case ForgotPasswordSuccessState():
              showToast(
                msg: 'تم إرسال كود إعادة تعيين كلمة المرور إلي الايميل بنجاح',
                color: Colors.green,
              );
              context.pushReplacement(Routes.resetPasswordScreen);

            default:
          }
        },
      ),
    );
  }

  void setupError(BuildContext context, error) {
    showToast(
      msg: ApiErrorHandler.handleError(error).message,
      color: Colors.green,
    );
  }
}
