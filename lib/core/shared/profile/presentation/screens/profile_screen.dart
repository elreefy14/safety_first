import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';
import 'package:safety_frist/core/widgets/name_password_text_form.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/profile_email_and_password_widget.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/profile_image_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الملف الشخصي'), leading: AppbarIcon()),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
            child: AutofillGroup(
              child: Form(
                child: Column(
                  children: [
                    ProfileImageWidget(),
                    verticalSpace(20),
                    Row(
                      children: [
                        Expanded(
                          child: NameTextFormField(
                            name: 'الإسم الأول',
                            nameController: TextEditingController(),
                          ),
                        ),
                        horizontalSpace(12),
                        Expanded(
                          child: NameTextFormField(
                            name: 'الإسم الأخير',
                            nameController: TextEditingController(),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    ProfileEmailAndPasswordWidget(),
                    verticalSpace(50),
                    SizedBox(
                      width: double.infinity,
                      child: AppTextButton(
                        textButton: 'تحديث الملف الشخصي',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
