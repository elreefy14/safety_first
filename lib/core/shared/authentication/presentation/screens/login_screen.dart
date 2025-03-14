import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/shared/authentication/data/models/user_type_model.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/login/client_dont_have_an_account.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/login/login_form_widget.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/login/login_welcome_message.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.userType});

  final UserType userType;

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
                Image.asset('assets/icons/logo_vertical.png'),
                MenteeWelcomeMessageWidget(userType: userType),
                verticalSpace(20),
                LoginFormWidget(),
                verticalSpace(16),
                userType == UserType.client
                    ? ClientDontHaveAnAccount()
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
