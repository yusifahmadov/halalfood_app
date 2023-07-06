import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../text_theme.dart';

class TextThemeLight implements ITextTheme {
  @override
  late final TextTheme data;

  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? headline6;

  @override
  TextStyle? subtitle1;

  @override
  TextStyle? subtitle2;
  @override
  final Color? primaryColor;

  TextThemeLight(this.primaryColor) {
    data = TextTheme(
      titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
      titleMedium:
          GoogleFonts.nunito(fontWeight: FontWeight.w400, color: Colors.white),
      bodyLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: "Segeo"),
      // bodyText2: GoogleFonts.nunito(
      //     color: Colors.black, fontSize:  14, fontWeight: FontWeight.w400),
      bodyMedium: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
          fontFamily: "Segeo"),
      displayLarge: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontFamily: "Segeo"),
      displayMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w600, fontSize: 15, color: Colors.black),
      displaySmall: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontFamily: "Segeo"),
      headlineMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w700, fontSize: 24, color: Colors.black),
    ).apply();
    fontFamily = GoogleFonts.nunito().fontFamily;
  }

  @override
  String? fontFamily;
}
