import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/shared/profile/data/models/profile_response_model.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_cubit.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_state.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';
import 'package:safety_frist/core/widgets/appbar_icon.dart';
import 'package:safety_frist/core/widgets/name_password_text_form.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/profile_email_and_password_widget.dart';
import 'package:safety_frist/core/shared/profile/presentation/widgets/profile_image_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});

  final ProfileResponseModel user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          TextEditingController emailController = TextEditingController();
          TextEditingController firstNameController = TextEditingController();
          TextEditingController lastNameController = TextEditingController();

          emailController.text = user.email!;
          firstNameController.text = user.firstName!;
          lastNameController.text = user.lastName!;

          return Scaffold(
            appBar: AppBar(title: Text('الملف الشخصي'), leading: AppbarIcon()),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.h,
                    horizontal: 16.w,
                  ),
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
                                  nameController: firstNameController,
                                ),
                              ),
                              horizontalSpace(12),
                              Expanded(
                                child: NameTextFormField(
                                  name: 'الإسم الأخير',
                                  nameController: lastNameController,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(20),
                          ProfileEmailAndPasswordWidget(email: user.email!),
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
        },
      ),
    );
  }
}
