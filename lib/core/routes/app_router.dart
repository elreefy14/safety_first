import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:safety_frist/core/routes/routes.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/change_password_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/client_register_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/forgot_password_screen.dart';
import 'package:safety_frist/core/shared/authentication/presentation/screens/user_type_screen.dart';
import 'package:safety_frist/core/shared/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:safety_frist/core/shared/onboarding/presentation/screens/splash_screen.dart';
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

    // Change Password Screen
    GoRoute(
      path: '/reset-password',
      builder: (BuildContext context, GoRouterState state) {
        final String? token = state.uri.queryParameters['token'];
        final String? email = state.uri.queryParameters['email'];
        return ChangePasswordScreen(token: token, email: email);
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
  ],
);
