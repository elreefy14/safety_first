import 'package:flutter/material.dart';

import 'package:safety_frist/core/helper/utils/extentions.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  البريد الإلكتروني',
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
        ),
        verticalSpace(4),
        AppTextFormField(
          textInputType: TextInputType.emailAddress,
          hintText: 'user42@gmail.com',
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          validator: (value) {},
        ),
        verticalSpace(32),
        SizedBox(
          width: double.infinity,
          child: AppTextButton(
            textButton: 'إرسال الرمز',
            onPressed: () {
              context.navigateTo(Routes.verificationCodeScreen);
            },
          ),
        ),
      ],
    );
  }
}
