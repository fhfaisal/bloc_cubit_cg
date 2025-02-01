import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_storage/get_storage.dart';

import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/onBoarding/on_boarding.dart';
import 'app_router.dart';

final storage = GetStorage();

final GoRouter router = GoRouter(
  initialLocation: determineInitialRoute(),
  routes: [
    GoRoute(
      name: AppRoutes.onboarding,
      path: '/',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      name: AppRoutes.login,
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      name: AppRoutes.home,
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

String determineInitialRoute() {
  final bool isFirstTime = storage.read('isFirstTime') ?? true;
  final bool isLoggedIn = storage.read('isLoggedIn') ?? false;

  if (isFirstTime) {
    return '/';
  } else if (!isLoggedIn) {
    return '/login';
  } else {
    return '/home';
  }
}
