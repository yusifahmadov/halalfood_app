import 'package:flutter/material.dart';

part './kind/dark_color.dart';
part './kind/light_color.dart';

@immutable
class AppColors {
  final Color white = const Color(0xffffffff);
  final Color green = const Color(0xff00BE92);
  final Color lightGreen = Colors.white;
  final Color mediumGrey = const Color.fromARGB(255, 212, 220, 227);
  final Color mediumGreyBold = const Color(0xff748a9d);
  final Color lighterGrey = const Color(0xfff0f4f8);
  final Color lightGrey = const Color(0xffF5F7F9);
  final Color darkerGrey = const Color(0xff404e5a);
  final Color darkGrey = const Color(0xffFCFCFC);
  final Color lightRed = const Color(0xfffff2f2);
  final Color blue = const Color(0xff1AB0B0);
  final Color ownRed = const Color(0xffFD6C6D);
  final Color lightContainerColor = Colors.white;

  final Color darkScaffoldBackground = const Color(0x0018191A);
  final Color darkAppBarColor = const Color(0x0018191A);
  final Color darkContainerColor = const Color(0xff242526);
  final Color darkTextColor = const Color(0xffe4e6eb);
}

abstract class IColors {
  AppColors get colors;
  Color? scaffoldBackgroundColor;
  Color? appBarColor;
  Color? tabBarColor;
  Color? fillColor;
  Color? tabbarSelectedColor;
  Color? tabbarNormalColor;
  Brightness? brightness;
  Color? primary;
  ColorScheme? colorScheme;
}
