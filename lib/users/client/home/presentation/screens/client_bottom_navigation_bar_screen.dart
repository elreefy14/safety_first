import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_frist/core/di/dependency_injection.dart';
import 'package:safety_frist/core/shared/profile/presentation/logic/profile_cubit.dart';
import 'package:safety_frist/core/shared/profile/presentation/screens/client_settings_screen.dart';
import 'package:safety_frist/users/client/bookings/presentation/logic/client_problems_cubit.dart';
import 'package:safety_frist/users/client/bookings/presentation/screens/client_bookings_screen.dart';
import 'package:safety_frist/users/client/home/presentation/logic/problem_cubit.dart';
import 'package:safety_frist/users/client/home/presentation/screens/client_home_screen.dart';

class ClientBottomNavigationBarScreen extends StatefulWidget {
  const ClientBottomNavigationBarScreen({super.key});

  @override
  State<ClientBottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends State<ClientBottomNavigationBarScreen> {
  final List<Widget> screens = [
    const ClientHomeScreen(),
    ClientBookingsScreen(),
    const ClientSettingsScreen(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProblemCubit>()..getAllProblemTypes(),
        ),
        BlocProvider(
          create:
              (context) => getIt<ClientProblemsCubit>()..getClientProblems(),
        ),
        BlocProvider(
          create: (context) => getIt<ProfileCubit>()..getProfileDate(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: Image.asset('assets/icons/app_icon.png'),
            ),
          ],
          title: Text('SAFETY FIRST'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: screens[_currentIndex],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
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
                Icons.settings,
                size: 30,
                color:
                    Theme.of(
                      context,
                    ).bottomNavigationBarTheme.selectedIconTheme?.color,
              ),
              label: 'الإعدادات',
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
      ),
    );
  }
}
