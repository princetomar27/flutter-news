import 'package:flutter/material.dart';

class ColorPalettes {
  // Colors for light theme
  static Color lightPrimary = const Color(0xfff2f3f7);
  static Color lightAccent = Colors.redAccent;
  static Color lightBackground = const Color(0xfff2f3f7);
  static Color lightTextPrimary = const Color(0xff0a0a0c);
  static Color lightTextSecondary = const Color(0xffaeaeb3);

  // Colors for dark theme
  static Color darkPrimary = Colors.black;
  static Color darkAccent = const Color(0xffCE281C);
  static Color darkBackground = const Color(0xff212121);
  static Color darkTextPrimary = const Color(0xffffffff);
  static Color darkTextSecondary = const Color(0xffaeaeb3);

  static Color white = const Color(0xffffffff);
  static Color grey = Colors.grey;
  static Color red = const Color(0xffCE281C);
  static Color yellow = Colors.yellow;
  static Color green = Colors.green;

  static ColorFilter grayscaleFilter = const ColorFilter.mode(
    Colors.grey,
    BlendMode.saturation,
  );

  static Color primaryColor = const Color(0xFF0C54BE);
}
