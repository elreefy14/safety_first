import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/forgot%20password/forgot_password_form_widget.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: const AppbarIcon(),
        title: Text('نسيت كلمة المرور'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: Column(
            spacing: 22.h,
            children: [
              SvgPicture.asset('assets/images/Forgot_Password.svg'),
              Text(
                'أدخل بريدك الإلكتروني لتلقي كلمة مرور لمرة واحدة (OTP) لإعادة تعيين كلمة المرور الخاصة بك',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ForgotPasswordFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
