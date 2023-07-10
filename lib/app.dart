import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:halalfood/core/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/route/go_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        supportedLocales: const [Locale('en'), Locale('az')],
        builder: EasyLoading.init(),
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        locale: const Locale('az'),
        theme: ThemeManager.craeteTheme(AppThemeLight()),
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
      ),
      builder: (context, child) {
        return child!;
      },
    );
  }
}
