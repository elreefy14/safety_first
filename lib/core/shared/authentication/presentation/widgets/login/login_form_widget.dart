import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/app_regex.dart';
import 'package:safety_frist/core/helper/functions/validator.dart';
import 'package:safety_frist/core/helper/utils/extentions.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/forgot%20password/forgot_password_message_widget.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  bool isObscureText = true;
  IconData visibility = Icons.visibility_off_outlined;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '  البريد الإلكتروني',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
          ),
          verticalSpace(2),
          AppTextFormField(
            textInputType: TextInputType.emailAddress,
            hintText: 'user42@gmail.com',
            controller: emailController,
            prefixIcon: Icon(
              Icons.email_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            validator: (value) {
              if (AppRegex.isEmailValid(value!) == false) {
                return 'بالرجاء إدخال اسماَ صالحاً';
              } else {
                return null;
              }
            },
          ),
          verticalSpace(16),
          Text(
            '  كلمة المرور',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
          ),
          verticalSpace(2),
          AppTextFormField(
            textInputType: TextInputType.visiblePassword,
            hintText: '********',
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
            validator: (value) {
              return passwordValidator(value);
            },
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              icon: Icon(isObscureText == true ? visibility : Icons.visibility),
            ),
          ),
          verticalSpace(8),
          const ForgotPasswordMessageWidget(),
          verticalSpace(50),
          SizedBox(
            width: double.infinity,
            child: AppTextButton(
              textButton: 'تسجيل الدخول',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.navigateToReplacement(Routes.clientBottomNavBar);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
