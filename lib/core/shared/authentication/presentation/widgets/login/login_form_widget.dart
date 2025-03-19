import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/data/models/user_type_model.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/forgot%20password/forgot_password_message_widget.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/email_text_form_field.dart';
import 'package:safety_frist/core/widgets/password_text_form_field.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key, required this.userType});

  final UserType userType;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController passwordController = TextEditingController();

    return AutofillGroup(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailTextFormField(),
            verticalSpace(8),
            PasswordFormField(passwordController: passwordController),
            verticalSpace(8),
            const ForgotPasswordMessageWidget(),
            verticalSpace(50),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                textButton: 'تسجيل الدخول',
                onPressed: () {
                  if (userType == UserType.client) {
                    context.pushReplacement(Routes.clientBottomNavBar);
                  } else if (userType == UserType.admin) {
                    context.pushReplacement(Routes.adminBottomNavBar);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
