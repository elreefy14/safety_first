import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/app_regex.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '  البريد الإلكتروني',
          style: Theme.of(
            context,
          ).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
        ),
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
      ],
    );
  }
}
