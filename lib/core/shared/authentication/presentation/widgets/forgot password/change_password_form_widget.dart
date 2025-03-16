import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:safety_frist/core/widgets/password_text_form_field.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/password_validator_instructions.dart';

class ChangePasswordFormWidget extends StatelessWidget {
  const ChangePasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey();

    return AutofillGroup(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PasswordFormField(title: '  كلمة المرور الجديدة'),
            verticalSpace(8),
            PasswordValidatorInstructions(),
            verticalSpace(30),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                textButton: 'حفظ كلمة المرور',
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
