import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safety_frist/core/widgets/email_text_form_field.dart';
import 'package:safety_frist/core/widgets/name_password_text_form.dart';
import 'package:safety_frist/core/widgets/password_text_form_field.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/password_validator_instructions.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

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
            Row(
              children: [
                Expanded(child: NameTextFormField(name: 'الإسم الأول')),
                horizontalSpace(12),
                Expanded(child: NameTextFormField(name: 'الإسم الأخير')),
              ],
            ),
            verticalSpace(8),
            EmailTextFormField(),
            verticalSpace(8),
            PasswordFormField(passwordController: passwordController),
            verticalSpace(8),
            PasswordValidatorInstructions(
              passwordController: passwordController,
            ),
            verticalSpace(30),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                textButton: 'إنشاء حساب',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    log('validate');
                  } else {
                    log('Invalid');
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
