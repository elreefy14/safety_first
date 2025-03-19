import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              spacing: 16.h,
              children: [
                Image.asset('assets/icons/logo_vertical_edit.png'),
                LoginWelcomeMessage(userType: userType),
                LoginFormWidget(userType: userType),
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
