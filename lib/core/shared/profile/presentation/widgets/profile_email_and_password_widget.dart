import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';

class ProfileEmailAndPasswordWidget extends StatelessWidget {
  const ProfileEmailAndPasswordWidget({super.key});

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
        AppTextFormField(enabled: false, hintText: 'user42@gmail.com'),
        verticalSpace(20),
        Text(
          '  كلمة المرور',
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
        ),
        AppTextFormField(enabled: false, hintText: '*********'),
      ],
    );
  }
}
