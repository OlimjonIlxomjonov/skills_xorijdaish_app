import 'package:flutter/cupertino.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void close() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState!.pop();
    }
  }

  static void go(Widget page) {
    navigatorKey.currentState!.push(_createRoute(page));
  }

  static void open(Widget page) {
    navigatorKey.currentState!.pushAndRemoveUntil(
      _createRoute(page),
      (Route<dynamic> route) => false,
    );
  }

  static void replace(Widget page) {
    navigatorKey.currentState!.pushReplacement(_createRoute(page));
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }
}
