import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/app_regex.dart';
import 'package:safety_frist/core/widgets/password_validations.dart';
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

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '  إسم المؤسسة',
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Color(0xff000000)),
          ),
          verticalSpace(2),
          AppTextFormField(
            textInputType: TextInputType.text,
            hintText: 'مصنع الحديد والصلب',
            controller: nameController,
            prefixIcon: Icon(
              Icons.factory_outlined,
              color: Theme.of(context).iconTheme.color,
            ),
            validator: (value) {
              if (AppRegex.isNameValid(value!) == false) {
                return 'بالرجاء إدخال اسماَ صالحاً';
              } else {
                return null;
              }
            },
          ),
          verticalSpace(8),
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
          verticalSpace(8),
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
            controller: passwordController,
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: Theme.of(context).iconTheme.color,
            ),
            validator: (value) {
              AppRegex.isPasswordValid(value!);
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
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          verticalSpace(30),
          SizedBox(
            width: double.infinity,
            child: AppTextButton(
              textButton: 'إنشاء حساب',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  print('validate');
                } else {
                  print('Invalid');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
