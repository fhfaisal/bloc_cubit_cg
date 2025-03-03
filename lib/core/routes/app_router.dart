
import 'package:cubit_bloc/core/storage/storage_service.dart';
import 'package:cubit_bloc/presentation/pages/auth/signup_page.dart';
import 'package:go_router/go_router.dart';
import '../../presentation/pages/auth/login_page.dart';
import '../../presentation/pages/home/home_page.dart';
import '../../presentation/pages/onBoarding/on_boarding.dart';
import 'app_routes.dart';

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
      name: AppRoutes.signing,
      path: '/signing',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: AppRoutes.home,
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ],
);

String determineInitialRoute() {
  final storage = StorageService();
  final bool isFirstTime = storage.isFirstTime();
  final bool isLoggedIn = storage.isLoggedIn();

  if (isFirstTime) {
    return '/'; // Ensure this is correct
  } else if (!isLoggedIn) {
    return '/login';
  } else {
    return '/home';
  }
}

