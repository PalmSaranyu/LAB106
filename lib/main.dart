import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palm/Screen/home_sceen.dart';
import 'package:palm/Screen/login_screen.dart';
import 'package:palm/Screen/main_screen.dart';
import 'package:palm/Screen/product_detail_screen.dart';
import 'package:palm/Screen/product_listing_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
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
        GoRoute(
          path: 'product/:id',
          builder: (BuildContext context, GoRouterState state) {
            // get value from path or query string
            var id = state.pathParameters['id'] ?? '';
            return ProductDetailScreen(productId: id);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
