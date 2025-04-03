import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/profile_image_widget.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/email_text_form_field.dart';
import 'package:safety_frist/core/widgets/name_password_text_form.dart';
import 'package:safety_frist/core/widgets/password_text_form_field.dart';
import 'package:safety_frist/core/widgets/password_validator_instructions.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_cubit.dart';
import 'package:safety_frist/users/admin/technichians/presentation/logic/technician/technician_state.dart';

class AddTechnicianFormWidget extends StatelessWidget {
  const AddTechnicianFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = TechnicianCubit.get(context);
    return AutofillGroup(
      child: Form(
        key: cubit.formKey,
        child: Column(
          children: [
            ProfileImageWidget(),
            verticalSpace(20),
            Row(
              children: [
                Expanded(
                  child: NameTextFormField(
                    name: 'الإسم الأول',
                    nameController: cubit.firstNameController,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: NameTextFormField(
                    name: 'الإسم الأخير',
                    nameController: cubit.lastNameController,
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            EmailTextFormField(emailController: cubit.emailController),
            verticalSpace(8),
            PasswordFormField(passwordController: cubit.passwordController),
            verticalSpace(8),
            PasswordValidatorInstructions(
              passwordController: cubit.passwordController,
            ),
            verticalSpace(30),
            BlocBuilder<TechnicianCubit, TechnicianState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    textButton: 'أضافة',
                    isLoading:
                        state is AddTechnicianLoadingState ? true : false,
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
    if (TechnicianCubit.get(context).formKey.currentState!.validate()) {
      TechnicianCubit.get(context).addTechnician();
    }
  }
}
