import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/helper/utils/spacing.dart';
import 'package:safety_frist/core/shared/authentication/data/models/user_type_model.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/login_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/user_type_item_widget.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  int selectedIndex = 0;

  List<UserTypeModel> listUserType = [
    UserTypeModel(
      image: 'assets/images/the_client.svg',
      userType: UserType.client,
      user: 'عـميل',
    ),
    UserTypeModel(
      image: 'assets/images/the_manager.svg',
      userType: UserType.admin,
      user: 'مديـر',
    ),
    UserTypeModel(
      image: 'assets/images/the_technichian.svg',
      userType: UserType.technichian,
      user: 'فنـي',
    ),
  ];

  UserType userType = UserType.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'اختر نوع الحساب',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                verticalSpace(20),
                Expanded(
                  child: ListView.builder(
                    itemCount: listUserType.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.w),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              userType = listUserType[selectedIndex].userType;
                            });
                          },
                          child: UserTypeItemWidget(
                            userType: listUserType,
                            index: index,
                            selectedIndex: selectedIndex,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                verticalSpace(30),
                SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    textButton: 'استمر',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => LoginScreen(userType: userType),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
