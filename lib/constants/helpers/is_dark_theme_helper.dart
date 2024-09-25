import 'package:flutter/material.dart';

extension DartThemeModel on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}
