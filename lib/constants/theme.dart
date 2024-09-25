import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'helpers/is_dark_theme_helper.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Raleway',
    primaryColor: ColorPalettes.lightPrimary,
    scaffoldBackgroundColor: ColorPalettes.lightBackground,
    dividerColor: ColorPalettes.darkBackground,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorPalettes.lightAccent),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalettes.appBarPrimary,
      iconTheme: IconThemeData(color: ColorPalettes.darkBackground),
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: ColorPalettes.darkBackground,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ).bodyMedium,
      titleTextStyle: TextStyle(
        color: ColorPalettes.darkBackground,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: ColorPalettes.lightPrimary,
      secondary: ColorPalettes.lightAccent,
    ).copyWith(background: ColorPalettes.lightBackground),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
    primaryColor: ColorPalettes.darkPrimary,
    scaffoldBackgroundColor: ColorPalettes.darkBackground,
    dividerColor: ColorPalettes.lightPrimary,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: ColorPalettes.darkAccent),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalettes.appBarPrimary,
      iconTheme: IconThemeData(color: ColorPalettes.lightBackground),
      toolbarTextStyle: TextTheme(
        titleLarge: TextStyle(
          color: ColorPalettes.lightBackground,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ).bodyMedium,
      titleTextStyle: TextStyle(
        color: ColorPalettes.lightBackground,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: ColorPalettes.darkPrimary,
      secondary: ColorPalettes.darkAccent,
    ).copyWith(background: ColorPalettes.darkBackground),
  );

  static TextStyle titleBarStyle(BuildContext context) {
    return TextStyle(
      color: context.isDarkMode
          ? ColorPalettes.darkTextPrimary
          : ColorPalettes.lightTextPrimary,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }
}
