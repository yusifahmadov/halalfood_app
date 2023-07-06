part of '../color_manager.dart';

class DarkColors implements IColors {
  @override
  final AppColors colors = AppColors();

  @override
  ColorScheme? colorScheme;

  @override
  Brightness? brightness;

  @override
  Color? appBarColor;

  @override
  Color? scaffoldBackgroundColor;

  @override
  Color? tabBarColor;

  @override
  Color? tabbarNormalColor;

  @override
  Color? tabbarSelectedColor;

  DarkColors() {
    appBarColor = colors.darkAppBarColor;
    scaffoldBackgroundColor = colors.darkScaffoldBackground;
    fillColor = colors.lightGrey;
    tabBarColor = colors.green;
    tabbarNormalColor = colors.green;
    tabbarSelectedColor = colors.green;

    colorScheme = const ColorScheme.dark().copyWith(
        onPrimary: colors.green,
        onSecondary: colors.green,
        onBackground: colors.darkContainerColor);
    brightness = Brightness.dark;
  }

  @override
  Color? primary;

  @override
  Color? fillColor;
}
