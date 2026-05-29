import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = FlexThemeData.light(
    useMaterial3: true,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 12, height: 16 / 12, letterSpacing: 0.4),
      bodyMedium: TextStyle(fontSize: 14, height: 20 / 14, letterSpacing: 0.25),
      bodyLarge: TextStyle(fontSize: 16, height: 24 / 16, letterSpacing: 0.15),
      headlineSmall: TextStyle(fontSize: 24, height: 32 / 24, letterSpacing: 0),
      headlineMedium: TextStyle(
        fontSize: 28,
        height: 36 / 28,
        letterSpacing: 0,
      ),
      headlineLarge: TextStyle(fontSize: 32, height: 40 / 32, letterSpacing: 0),
      displaySmall: TextStyle(fontSize: 36, height: 44 / 36, letterSpacing: 0),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00C3D0),
      primary: Color(0xFF00C3D0),
      brightness: Brightness.light,
    ),
    subThemesData: FlexSubThemesData(
      useMaterial3Typography: true,
      scaffoldBackgroundSchemeColor: SchemeColor.surface,
      appBarBackgroundSchemeColor: SchemeColor.surface,
    ),
    useMaterial3ErrorColors: true,
    fontFamily: 'Sans',
  );
}
