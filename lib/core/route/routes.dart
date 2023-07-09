import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:halalfood/core/route/go_router.dart';

class Routes {
  static const root = '/';
  static const homeNamedPage = '/home';
  static const homeDetailsNamedPage = 'details';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';

  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const ErrorScreen();
}
