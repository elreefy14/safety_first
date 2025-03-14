import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/app_text_form_field.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  bool isObscureText = true;
  IconData visibility = Icons.visibility_off_outlined;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('  إسم المؤسسة', style: Theme.of(context).textTheme.titleSmall),
          verticalSpace(4),
          AppTextFormField(
            textInputType: TextInputType.text,
            hintText: 'مصنع الحديد والصلب',
            prefixIcon: Icon(
              Icons.factory_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            validator: (value) {},
          ),
          verticalSpace(16),
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
          verticalSpace(16),
          Text(
            '  كلمة المرور',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
          ),
          verticalSpace(4),
          AppTextFormField(
            textInputType: TextInputType.visiblePassword,
            hintText: '********',
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
            validator: (value) {},
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
          verticalSpace(50),
          SizedBox(
            width: double.infinity,
            child: AppTextButton(textButton: 'تسجيل الدخول', onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
