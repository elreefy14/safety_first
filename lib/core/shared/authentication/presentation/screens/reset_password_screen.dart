import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/forgot%20password/change_password_form_widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, this.token, this.email});

  final String? token;
  final String? email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: Text('إعادة تعيين كلمة مرور')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: Column(
              spacing: 20.h,
              children: [
                SvgPicture.asset('assets/images/New_Password.svg'),
                Text(
                  'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور السابقة',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                ChangePasswordFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
