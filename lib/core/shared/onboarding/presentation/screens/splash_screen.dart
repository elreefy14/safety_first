// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/cache/cache_helper.dart';
import 'package:safety_frist/core/cache/cache_helper_keys.dart';
import 'package:safety_frist/core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          context.go(startedScreen());
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF010930),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset('assets/icons/logo_vertical.png'),
        ),
      ),
    );
  }

  String startedScreen() {
    var login = CacheHelper.getData(key: CacheHelperKeys.login);
    var onBoarding = CacheHelper.getData(key: CacheHelperKeys.onBoarding);
    if (onBoarding == false) {
      return Routes.userTypeScreen;
    } else if (login == Routes.clientBottomNavBar) {
      return Routes.clientBottomNavBar;
    } else if (login == Routes.adminBottomNavBar) {
      return Routes.adminBottomNavBar;
    } else if (login == Routes.technicianBottomNavBar) {
      return Routes.technicianBottomNavBar;
    } else if (onBoarding == true) {
      return Routes.userTypeScreen;
    } else {
      return Routes.onboardingScreen;
    }
  }
}
