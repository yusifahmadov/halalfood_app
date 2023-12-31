import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/core/shared_preferences/custom_shared_preferences.dart';
import 'package:halalfood/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:halalfood/features/auth/presentation/pages/auth_page_view.dart';
import 'package:halalfood/features/main/presentation/pages/main_page_view.dart';
import 'package:halalfood/features/product/presentation/pages/product_detail_page_view.dart';
import 'package:halalfood/features/product/presentation/pages/product_page_view.dart';
import 'package:halalfood/features/user/presentation/pages/account_page_view.dart';
import 'package:halalfood/features/user/presentation/pages/signin_page_view.dart';

import 'package:halalfood/features/user/presentation/pages/signup_page_view.dart';
import 'package:halalfood/injection.dart';

import 'error_screen.dart';

final AuthCubit authCubit = getIt<AuthCubit>();

class AppRouter {
  static final _shellProfileNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellHomeNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    errorBuilder: (context, state) => const ErrorScreen(),
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) async {
          if (await CustomSharedPreferences.readUser("userdata") != null) {
            return '/home';
          }
          return '/auth';
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainPageView(
            body: navigationShell,
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: navigationShell.goBranch,
          );
        },
        parentNavigatorKey: navigatorKey,
        branches: [
          StatefulShellBranch(navigatorKey: _shellHomeNavigatorKey, routes: [
            GoRoute(
              parentNavigatorKey: _shellHomeNavigatorKey,
              path: '/home',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProductPageView()),
              routes: const [],
            ),
          ]),
          StatefulShellBranch(navigatorKey: _shellProfileNavigatorKey, routes: [
            GoRoute(
              parentNavigatorKey: _shellProfileNavigatorKey,
              path: '/profile',
              pageBuilder: (context, state) =>
                  NoTransitionPage(child: AccountPageView()),
            ),
          ])
        ],
      ),
      GoRoute(
        parentNavigatorKey: navigatorKey,
        path: '/product/:id',
        pageBuilder: (context, state) => NoTransitionPage(
            child: ProductDetailPageView(
          cubit: (state.extra as List)[0],
          id: (state.extra as List)[1],
        )),
      ),
      GoRoute(
        path: '/auth',
        routes: [
          GoRoute(
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SignupPageView()),
            path: 'signup',
          ),
          GoRoute(
            path: 'signin',
            pageBuilder: (context, state) => NoTransitionPage(
                child: SignInPageView(
              authCubit: state.extra as AuthCubit,
            )),
          ),
        ],
        builder: (context, state) {
          return AuthPageView();
        },
      ),
    ],
  );
}
