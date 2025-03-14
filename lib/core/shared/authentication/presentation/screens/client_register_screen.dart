import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/register/client_have_an_account.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/register/register_form_widget.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/register/register_welcome_message.dart';

class ClientRegisterScreen extends StatelessWidget {
  const ClientRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 30.h),
            child: Column(
              children: [
                SizedBox(
                  child: Image.asset('assets/icons/logo_horizontal_edit.png'),
                ),
                RegisterWelcomeMessage(),
                verticalSpace(20),
                RegisterFormWidget(),
                verticalSpace(16),
                ClientHaveAnAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
