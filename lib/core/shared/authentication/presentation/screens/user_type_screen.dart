import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/shared/authentication/data/models/user_type_model.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/login_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/widgets/user%20type/user_type_item_widget.dart';
import 'package:safety_frist/core/widgets/app_text_button.dart';

class UserTypeScreen extends StatefulWidget {
  const UserTypeScreen({super.key});

  @override
  State<UserTypeScreen> createState() => _UserTypeScreenState();
}

class _UserTypeScreenState extends State<UserTypeScreen> {
  int selectedIndex = 0;

  List<UserTypeModel> listUser = listUserType;

  UserType userType = UserType.client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              spacing: 20.h,
              children: [
                Text(
                  'اختر نوع الحساب',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                usersListView(),
                SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    textButton: 'استمر',
                    onPressed: () => _navigateToLoginScreen(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded usersListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: listUser.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  userType = listUser[selectedIndex].userType;
                });
              },
              child: UserTypeItemWidget(
                userType: listUser,
                index: index,
                selectedIndex: selectedIndex,
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToLoginScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (context, animation, secondaryAnimation) =>
                LoginScreen(userType: userType),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
    );
  }
}
