import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/build_page_route.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:safety_frist/features/onboarding/presentation/screens/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final String routeName = settings.name!;

    switch (routeName) {
      // App
      case Routes.splashScreen:
        return smoothEaseInOutPageRoute(
          const SplashScreen(),
          settings: settings,
        );

      case Routes.onboardingScreen:
        return smoothEaseInOutPageRoute(
          const OnboardingScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
