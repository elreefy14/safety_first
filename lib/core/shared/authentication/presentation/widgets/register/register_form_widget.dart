import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safety_frist/core/widgets/email_text_form_field.dart';
import 'package:safety_frist/core/widgets/name_password_text_form.dart';
import 'package:safety_frist/core/widgets/password_text_form_field.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/password_validator_instructions.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NamePasswordTextForm(),
            verticalSpace(8),
            EmailTextFormField(),
            verticalSpace(8),
            PasswordFormField(),
            verticalSpace(8),
            PasswordValidatorInstructions(),
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
