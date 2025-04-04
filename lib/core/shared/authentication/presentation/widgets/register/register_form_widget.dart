import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/shared/authentication/presentation/logic/register/register_cubit.dart';
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
    return AutofillGroup(
      child: Form(
        key: RegisterCubit.get(context).formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: NameTextFormField(
                    name: 'الإسم الأول',
                    nameController:
                        RegisterCubit.get(context).firstNameController,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: NameTextFormField(
                    name: 'الإسم الأخير',
                    nameController:
                        RegisterCubit.get(context).lastNameController,
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            EmailTextFormField(
              emailController: RegisterCubit.get(context).emailController,
            ),
            verticalSpace(8),
            PasswordFormField(
              passwordController: RegisterCubit.get(context).passwordController,
            ),
            verticalSpace(8),
            PasswordValidatorInstructions(
              passwordController: RegisterCubit.get(context).passwordController,
            ),
            verticalSpace(30),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    textButton: 'إنشاء حساب',
                    isLoading: state is RegisterLoadingState ? true : false,
                    onPressed: () {
                      validateThenNavigate(context);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void validateThenNavigate(context) {
    if (RegisterCubit.get(context).formKey.currentState!.validate()) {
      RegisterCubit.get(context).emitRegisterStates();
    }
  }
}
