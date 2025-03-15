import 'package:flutter/material.dart';
import 'package:safety_frist/core/helper/functions/build_page_route.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/change_password_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/client_register_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/user_type_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/verification_code_screen.dart';
import 'package:safety_frist/core/shared/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:safety_frist/core/shared/onboarding/presentation/screens/splash_screen.dart';
import 'package:safety_frist/users/client/home/presentation/screens/client_bottom_navigation_bar_screen.dart';

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

      case Routes.userTypeScreen:
        return smoothEaseInOutPageRoute(
          const UserTypeScreen(),
          settings: settings,
        );

      case Routes.forgotPasswordScreen:
        return smoothEaseInOutPageRoute(
          const ForgotPasswordScreen(),
          settings: settings,
        );

      case Routes.verificationCodeScreen:
        return smoothEaseInOutPageRoute(
          const VerificationCodeScreen(),
          settings: settings,
        );

      case Routes.changePasswordScreen:
        return smoothEaseInOutPageRoute(
          const ChangePasswordScreen(),
          settings: settings,
        );

      case Routes.clientRegisterScreen:
        return smoothEaseInOutPageRoute(
          const ClientRegisterScreen(),
          settings: settings,
        );

      case Routes.clientBottomNavBar:
        return smoothEaseInOutPageRoute(
          const ClientBottomNavigationBarScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
