import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/client_register_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/verify_email_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/reset_password_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/user_type_screen.dart';
import 'package:safety_frist/core/shared/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:safety_frist/core/shared/onboarding/presentation/screens/splash_screen.dart';
import 'package:safety_frist/users/admin/technichians/presentation/screens/add_engineer_screen.dart';
import 'package:safety_frist/users/admin/technichians/presentation/screens/add_technician_screen.dart';
import 'package:safety_frist/users/admin/bookings/presentation/screens/admin_bottom_navigation_bar_screen.dart';
import 'package:safety_frist/users/client/home/presentation/screens/client_bottom_navigation_bar_screen.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    // Splash Screen
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),

    // Onboarding Screen
    GoRoute(
      path: Routes.onboardingScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
    ),

    // User Type Screen
    GoRoute(
      path: Routes.userTypeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const UserTypeScreen();
      },
    ),

    // Forgot Password Screen
    GoRoute(
      path: Routes.forgotPasswordScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const ForgotPasswordScreen();
      },
    ),

    // Reset Password Screen
    GoRoute(
      path: Routes.resetPasswordScreen,
      builder: (BuildContext context, GoRouterState state) {
        return ResetPasswordScreen();
      },
    ),

    // Verify Email Screen
    GoRoute(
      path: Routes.verifyEmailScreen,
      builder: (BuildContext context, GoRouterState state) {
        return VerifyEmailScreen();
      },
    ),

    // Client Register Screen
    GoRoute(
      path: Routes.clientRegisterScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const ClientRegisterScreen();
      },
    ),

    // Client Bottom Navigation Bar Screen
    GoRoute(
      path: Routes.clientBottomNavBar,
      builder: (BuildContext context, GoRouterState state) {
        return const ClientBottomNavigationBarScreen();
      },
    ),

    // Admin Bottom Navigation Bar Screen
    GoRoute(
      path: Routes.adminBottomNavBar,
      builder: (BuildContext context, GoRouterState state) {
        return const AdminBottomNavigationBarScreen();
      },
    ),

    // Admin Bottom Navigation Bar Screen
    GoRoute(
      path: Routes.addEngineerScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const AddEngineerScreen();
      },
    ),

    // Admin Bottom Navigation Bar Screen
    GoRoute(
      path: Routes.addTechnicianScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const AddTechnicianScreen();
      },
    ),
  ],
);
