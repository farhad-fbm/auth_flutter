import 'package:go_router/go_router.dart';
import 'package:uione/screens/car_owner_screen.dart';
import 'package:uione/screens/landing_screen.dart';
import 'package:uione/screens/repair_shop_screen.dart';

import '../features/animated_icons/icon_home_screen.dart';
import '../screens/error_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',

  // debugLogDiagnostics: true,
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),

  // // Route guard
  // redirect: (context, state) {
  //   final loggingIn = state.subloc == '/login';
  //   if (!isLoggedIn && !loggingIn) return '/login';
  //   if (isLoggedIn && loggingIn) return '/home';
  //   return null;
  // },
  routes: [
    GoRoute(path: '/', builder: (context, state) => const LandingScreen()),
    GoRoute(path: '/CarOwner', builder: (context, state) => const CarOwner()),
    GoRoute(
      path: '/CepairShop',
      builder: (context, state) => const RepairShop(),
    ),
    GoRoute(
      path: '/CoinRisePage',
      builder: (context, state) => const CoinRisePage(),
    ),
  ],
);
