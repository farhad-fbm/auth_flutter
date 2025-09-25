import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
