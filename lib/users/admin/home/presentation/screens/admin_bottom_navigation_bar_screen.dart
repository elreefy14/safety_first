import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/users/client/bookings/presentation/screens/client_bookings_screen.dart';
import 'package:safety_frist/users/client/home/presentation/screens/client_home_screen.dart';
import 'package:safety_frist/users/client/profile/presentation/screens/client_profile_screen.dart';

class AdminBottomNavigationBarScreen extends StatefulWidget {
  const AdminBottomNavigationBarScreen({super.key});

  @override
  State<AdminBottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends State<AdminBottomNavigationBarScreen> {
  final List<Widget> screens = [
    const ClientHomeScreen(),
     ClientBookingsScreen(),
    const ClientProfileScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Padding(
          padding:  EdgeInsets.only(left: 16.w),
          child: Image.asset('assets/icons/app_icon.png'),
        )],
        title: Text('SAFETY FIRST'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: screens[_currentIndex],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // height: 74.h,
        animationDuration: const Duration(milliseconds: 900),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        buttonBackgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        color: Theme.of(context).hoverColor,
        index: _currentIndex,
        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
              size: 30,
              color:
                  Theme.of(
                    context,
                  ).bottomNavigationBarTheme.selectedIconTheme?.color,
            ),
            label: 'الصفحة الرئيسية',
            labelStyle:
                Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.bookmark_border_rounded,
              size: 30,
              color:
                  Theme.of(
                    context,
                  ).bottomNavigationBarTheme.selectedIconTheme?.color,
            ),
            label: 'الطلـبات',
            labelStyle:
                Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.person_2_outlined,
              size: 30,
              color:
                  Theme.of(
                    context,
                  ).bottomNavigationBarTheme.selectedIconTheme?.color,
            ),
            label: 'الملف الشـخـصـي',
            labelStyle:
                Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
