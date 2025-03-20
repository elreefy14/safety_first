import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/email_text_form_field.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailTextFormField(emailController: TextEditingController()),
            verticalSpace(32),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                textButton: 'إرسال الرمز',
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
