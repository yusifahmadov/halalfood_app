import 'package:flutter/material.dart';
import 'package:halalfood/core/theme/app_theme.dart';
import 'package:halalfood/features/product/presentation/pages/product_page_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.craeteTheme(AppThemeLight()),
      home: ProductPageView(),
    );
  }
}
