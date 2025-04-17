import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/di/dependency_injection.dart' show getIt;
import 'package:safety_frist/core/helper/functions/show_toast.dart';
import 'package:safety_frist/core/shared/authentication/presentation/logic/register/register_cubit.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/verify_email_screen.dart';

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
              _navigateToVerifyEmailScreen(
                context,
                email: RegisterCubit.get(context).userModel!.email,
              );

            default:
          }
        },
      ),
    );
  }

  void _navigateToVerifyEmailScreen(
    BuildContext context, {
    required String email,
  }) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                VerifyEmailScreen(email: email),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
