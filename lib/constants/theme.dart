import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'helpers/is_dark_theme_helper.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Raleway',
    primaryColor: ColorPalettes.lightPrimary,
    scaffoldBackgroundColor: ColorPalettes.white,
    dividerColor: ColorPalettes.darkBackground,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: ColorPalettes.primaryColor,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          ColorPalettes.primaryColor,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(231, 48),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalettes.primaryColor,
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
      primary: ColorPalettes.darkPrimary,
      secondary: ColorPalettes.lightAccent,
    ).copyWith(background: ColorPalettes.lightBackground),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Raleway',
    brightness: Brightness.dark,
    primaryColor: ColorPalettes.darkPrimary,
    scaffoldBackgroundColor: Colors.black,
    dividerColor: ColorPalettes.lightPrimary,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: ColorPalettes.primaryColor,
          width: 1.5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          ColorPalettes.primaryColor,
        ),
        minimumSize: MaterialStateProperty.all(
          const Size(231, 48),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorPalettes.primaryColor,
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
