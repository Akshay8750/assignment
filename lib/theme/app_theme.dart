import 'package:flutter/material.dart';

import 'color_scheme.dart';

class AppTheme {
  ///light theme for the app
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColorScheme.lightColorScheme.background,
      primaryColor: AppColorScheme.lightColorScheme.primary,
      colorScheme: AppColorScheme.lightColorScheme);
}
