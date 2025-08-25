import 'package:flutter/cupertino.dart';
import 'package:foodgo/views/screens/home_page.dart';
import 'package:foodgo/views/screens/splash_page.dart';
import 'package:go_router/go_router.dart';

class ScreenPaths {
  static const splash = '/';
  static const home = '/home';
  static const profile = '/profile';
  static const cart = '/cart';
  static const mealDetails = '/meal-details';
}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: ScreenPaths.splash,
      builder: (BuildContext context, GoRouterState state) {
        return SplashPage();
      },
    ),
    GoRoute(
      path: ScreenPaths.home,
      builder: (BuildContext context, GoRouterState state) {
        return HomePage();
      },
    ),
  ],
);
