part of '../color_manager.dart';

class LightColors implements IColors {
  @override
  final AppColors colors = AppColors();

  @override
  ColorScheme? colorScheme;
  @override
  Color? appBarColor;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  Color? ownRed;
  @override
  Color? tabbarSelectedColor;

  LightColors() {
    appBarColor = colors.white;
    fillColor = colors.lightGrey;

    scaffoldBackgroundColor = colors.white;
    tabBarColor = colors.green;
    primary = Colors.red;

    tabbarNormalColor = colors.darkerGrey;
    tabbarSelectedColor = colors.green;
    ownRed = colors.ownRed;

    colorScheme = const ColorScheme.light().copyWith(
        primary: colors.green,
        primaryContainer: colors.lightGreen,
        secondaryContainer: colors.lightRed,
        onPrimary: Colors.white,
        onSecondary: colors.white,
        onError: colors.ownRed,
        onSurface: colors.mediumGreyBold,
        onBackground: colors.lightContainerColor);
    brightness = Brightness.light;
  }

  @override
  Brightness? brightness;

  @override
  Color? primary;

  @override
  Color? fillColor;
}
