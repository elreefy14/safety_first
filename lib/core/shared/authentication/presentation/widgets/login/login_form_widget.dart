import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/shared/authentication/data/models/user_type_model.dart';
import 'package:safety_frist/core/shared/authentication/presentation/logic/login/login_cubit.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/forgot%20password/forgot_password_message_widget.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/email_text_form_field.dart';
import 'package:safety_frist/core/widgets/password_text_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key, required this.userType});

  final UserType userType;

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: LoginCubit.get(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailTextFormField(
              emailController: LoginCubit.get(context).emailController,
            ),
            verticalSpace(8),
            PasswordFormField(
              passwordController: LoginCubit.get(context).passwordController,
            ),
            verticalSpace(8),
            const ForgotPasswordMessageWidget(),
            verticalSpace(50),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    textButton: 'تسجيل الدخول',
                    isLoading: state is LoginLoadingState ? true : false,
                    onPressed: () {
                      validateThenNavigate(context);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateThenNavigate(context) {
    if (LoginCubit.get(context).formKey.currentState!.validate()) {
      LoginCubit.get(context).emitLoginStates();
    }
  }
}
