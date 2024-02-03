import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:palm/Screen/home_sceen.dart';
import 'package:palm/Screen/login_screen.dart';
import 'package:palm/Screen/main_screen.dart';
import 'package:palm/Screen/product_listing_screen.dart';
import 'package:palm/app_service.dart';
import 'package:palm/controllers/product_controller.dart';
import 'package:palm/controllers/user_controller.dart';

void main() {
  Get.put(UserController());
  Get.put(ProductController());
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  redirect: _redirect,
  refreshListenable: AppService.instance,
  navigatorKey: AppService.instance.navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'main',
          builder: (BuildContext context, GoRouterState state) {
            return const MainScreen();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: 'product_listing',
          builder: (BuildContext context, GoRouterState state) {
            return const ProductListingScreen();
          },
        ),
      ],
    ),
  ],
);

String? _redirect(BuildContext context, GoRouterState state) {
  final isLoggedIn = AppService.instance.isLogged;

  if (!isLoggedIn) {
    return '/';
  } else if (isLoggedIn && state.matchedLocation == '/') {
    return '/main';
  }
  return null;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
