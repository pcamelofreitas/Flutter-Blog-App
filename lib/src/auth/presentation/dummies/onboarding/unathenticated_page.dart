import 'package:flutter/material.dart';

import 'package:blog_app_2/src/auth/presentation/dummies/onboarding/unauthenticated_screen.dart';

class UnauthenticatedPage extends Page {
  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: const Duration(milliseconds: 1200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: const UnauthenticatedScreen(),
        );
      },
    );
  }
}
