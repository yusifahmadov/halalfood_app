import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/main/presentation/pages/main_page_view.dart';
import 'package:halalfood/features/product/presentation/pages/product_page_view.dart';
import 'package:halalfood/features/user/presentation/pages/signin_page_view.dart';

import 'package:halalfood/features/user/presentation/pages/signup_page_view.dart';
import 'package:halalfood/injection.dart';

GoRouter router = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      routes: [
        GoRoute(
          path: 'signup',
          builder: (context, state) {
            return const SignupPageView();
          },
        ),
        GoRoute(
          path: 'signin',
          builder: (context, state) {
            return SignInPageView(
              authCubit: state.extra as AuthCubit,
            );
          },
        ),
      ],
      builder: (context, state) {
        return const MainPageView();
      },
    ),
    GoRoute(
      path: '/products',
      builder: (context, state) {
        return ProductPageView(
          authCubit: state.extra as AuthCubit,
        );
      },
    ),
  ],
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Xəta",
        ),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "Səhifə tapılmadı!",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
