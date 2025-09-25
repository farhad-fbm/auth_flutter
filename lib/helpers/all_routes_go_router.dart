import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:go_router/go_router.dart';
import 'package:uione/features/auth/car_owner_screen.dart';
import 'package:uione/screens/landing_screen.dart';
import 'package:uione/features/auth/repair_shop_screen.dart';

import '../features/animated_icons/icon_home_screen.dart';
import '../features/image_pickers/presentation/image_upload_screen.dart';
import '../features/image_pickers/presentation/images_showing_screen.dart';
import '../features/tasks/presentation/add_task_screen.dart';
import '../features/tasks/presentation/shop_home_screen.dart';
import '../screens/error_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',

  debugLogDiagnostics: true,
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
    GoRoute(
      path: '/car_owner',
      pageBuilder: (context, state) =>
          customTransition(key: state.pageKey, context: context, child: const CarOwner()),
    ),
    GoRoute(
      path: '/repair_shop',
      pageBuilder: (context, state) =>
          customTransition(key: state.pageKey, context: context, child: const RepairShop()),
    ),
    GoRoute(
      path: '/coin_rise_page',
      pageBuilder: (context, state) =>
          customTransition(key: state.pageKey, context: context, child: const CoinRisePage()),
    ),
    GoRoute(
      path: '/img_upload',
      pageBuilder: (context, state) =>
          customTransition(key: state.pageKey, context: context, child: const ImageUploadScreen()),
      routes: [
        GoRoute(
          path: '/img_show',
          pageBuilder: (context, state) => customTransition(
            key: state.pageKey,
            context: context,
            // ---------------------------------------------------------------------- Passing List Of IMAGES
            child: ImagesShowingScreen(images: state.extra as List<File>),
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/shop_home',
      pageBuilder: (context, state) =>
          customTransition(key: state.pageKey, context: context, child: const ShopHomeScreen()),
      routes: [
        GoRoute(
          path: '/add_task',
          pageBuilder: (context, state) =>
              customTransition(key: state.pageKey, context: context, child: const AddTaskScreen()),
        ),
      ],
    ),
  ],
);
/*
.
.
//____________________________________________________________________________________________________________________________________
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
*/
Page<T> customTransition<T>({
  required Widget child,
  required LocalKey key,
  required BuildContext context,
  Duration duration = const Duration(milliseconds: 300),
}) {
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    return CupertinoPage<T>(key: key, child: child);
  } else {
    return CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      },
    );
  }
}
