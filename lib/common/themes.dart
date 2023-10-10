import 'package:flutter/material.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: lightColorScheme.brightness,
      primaryColor: lightColorScheme.primary,
      hintColor: lightColorScheme
          .secondary, // Accent color is not directly in ColorScheme.
      canvasColor: lightColorScheme.background,
      cardColor: lightColorScheme.surface,
      scaffoldBackgroundColor: lightColorScheme.background,
      dividerColor: lightColorScheme.onBackground.withOpacity(0.12),
      iconTheme: IconThemeData(color: lightColorScheme.onPrimary),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: lightColorScheme.onBackground,
            fontSize: 28,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: lightColorScheme.onBackground,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            color: lightColorScheme.onBackground,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      colorScheme: lightColorScheme,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: darkColorScheme.brightness,
      primaryColor: darkColorScheme.primary,
      hintColor: darkColorScheme
          .secondary, // Accent color is not directly in ColorScheme.
      canvasColor: darkColorScheme.background,
      cardColor: darkColorScheme.surface,
      scaffoldBackgroundColor: darkColorScheme.background,
      dividerColor: darkColorScheme.onBackground.withOpacity(0.12),
      iconTheme: IconThemeData(color: darkColorScheme.onPrimary),
      textTheme: TextTheme(
        displayLarge: TextStyle(
            color: darkColorScheme.onBackground,
            fontSize: 28,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            color: darkColorScheme.onBackground,
            fontSize: 24,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            color: darkColorScheme.onBackground,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      colorScheme: darkColorScheme,
    );
  }
}

class AppThemeData {
  final ColorScheme colorScheme;
  final ColorScheme darkColorScheme;

  AppThemeData({
    required this.colorScheme,
    required this.darkColorScheme,
  });
}

class AppColorScheme {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color surface;
  final Color onPrimary;
  final Color onSecondary;
  final Color onBackground;
  final Color onSurface;
  final Color error;
  final Color onError;
  final Brightness brightness;

  AppColorScheme({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.surface,
    required this.onPrimary,
    required this.onSecondary,
    required this.onBackground,
    required this.onSurface,
    required this.error,
    required this.onError,
    required this.brightness,
  });
}

// class AppTheme {
//   static final AppColorScheme lightColorScheme = AppColorScheme(
//     primary: Color(0xFF6200EE),
//     secondary: Color(0xFF03DAC6),
//     background: Color(0xFFFFFFFF),
//     surface: Color(0xFFFFFFFF),
//     onPrimary: Color(0xFFFFFFFF),
//     onSecondary: Color(0xFF000000),
//     onBackground: Color(0xFF000000),
//     onSurface: Color(0xFF000000),
//     error: Color(0xFFB00020),
//     onError: Color(0xFFFFFFFF),
//     brightness: Brightness.light,
//   );

//   static final AppColorScheme darkColorScheme = AppColorScheme(
//     primary: Color(0xFFBB86FC),
//     secondary: Color(0xFF03DAC6),
//     background: Color(0xFF121212),
//     surface: Color(0xFF121212),
//     onPrimary: Color(0xFF000000),
//     onSecondary: Color(0xFF000000),
//     onBackground: Color(0xFFFFFFFF),
//     onSurface: Color(0xFFFFFFFF),
//     error: Color(0xFFCF6679),
//     onError: Color(0xFF000000),
//     brightness: Brightness.dark,
//   );
// }