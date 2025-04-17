import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/shared/authentication/presentation/logic/forgot%20password/forgot_password_cubit.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/forgot%20password/otp_code_reset_password_widget.dart';
import 'package:safety_frist/core/widgets/password_text_form_field.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/password_validator_instructions.dart';

class ResetPasswordFormWidget extends StatelessWidget {
  const ResetPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: ForgotPasswordCubit.get(context).formKeyReset,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OtpCodeResetPasswordWidget(
              otpCodeController:
                  ForgotPasswordCubit.get(context).otpCodeController,
            ),
            verticalSpace(16),
            PasswordFormField(
              title: '  كلمة المرور الجديدة',
              passwordController:
                  ForgotPasswordCubit.get(context).passwordController,
            ),
            verticalSpace(8),
            PasswordValidatorInstructions(
              passwordController:
                  ForgotPasswordCubit.get(context).passwordController,
            ),
            verticalSpace(30),
            BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
              builder: (context, state) {
                return SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    textButton: 'حفظ كلمة المرور',
                    isLoading:
                        state is ResetPasswordLoadingState ? true : false,
                    onPressed: () async {
                      if (ForgotPasswordCubit.get(
                        context,
                      ).formKeyReset.currentState!.validate()) {
                        ForgotPasswordCubit.get(context).resetPassword(
                          email: await CacheHelper.getSecuredData(
                            key: CacheHelperKeys.email,
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
            verticalSpace(22),
            GestureDetector(
              onTap: () {
                ForgotPasswordCubit.get(context).resendOtpResetPassword();
              },
              child: Text(
                'إعادة إرسال الرمز',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
