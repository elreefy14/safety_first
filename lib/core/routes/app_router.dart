import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/client_register_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/confirm_email_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/reset_password_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/user_type_screen.dart';
import 'package:safety_frist/core/shared/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:safety_frist/core/shared/onboarding/presentation/screens/splash_screen.dart';
import 'package:safety_frist/users/admin/bookings/presentation/screens/admin_bottom_navigation_bar_screen.dart';
import 'package:safety_frist/users/client/home/presentation/screens/client_bottom_navigation_bar_screen.dart';
import 'package:safety_frist/core/shared/profile/presentation/screens/profile_screen.dart';

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
        final String? token = state.uri.queryParameters['token'];
        final String? email = state.uri.queryParameters['email'];
        return ResetPasswordScreen(token: token, email: email);
      },
    ),

    // Verify Email Screen
    GoRoute(
      path: Routes.verifyEmailScreen,
      builder: (BuildContext context, GoRouterState state) {
        return ConfirmEmailScreen();
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

    // Client Profile Screen
    GoRoute(
      path: Routes.profileScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileScreen();
      },
    ),

    // Admin Bottom Navigation Bar Screen
    GoRoute(
      path: Routes.adminBottomNavBar,
      builder: (BuildContext context, GoRouterState state) {
        return const AdminBottomNavigationBarScreen();
      },
    ),
  ],
);
