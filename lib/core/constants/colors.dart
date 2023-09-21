import 'package:flutter/material.dart';

class AppColors {
  // Dashboard colors for the progress ring
  static const unprocessedGreen = Color(0xFF4CAF50);
  static const processedBlue = Color(0xFF2196F3);
  static const ultraprocessedPurple = Color(0xFF9C27B0);

  // Black to white palette
  static const black = Color(0xFF000000);
  static const charcoal = Color(0xFF3E3E3E);
  static const darkGrey = Color(0xFF757575);
  static const grey = Color(0xFFAEAEAE);
  static const lightGrey = Color(0xFFCFCFCF);
  static const veryLightGrey = Color(0xFFECEAEA);
  static const white = Color(0xFFFFFFFF);

  // Color palette
  static const navy = Color(0xFF262E40);
  static const blue = Color(0xFF43567F);
  static const lightBlue = Color(0xFF98ACD5);
  static const gold = Color(0xFFD1DF34);
  static const brightYellow = Color(0xFFF6FF75);
  static const paleYellow = Color(0xFFF4F8AD);
  static const mustard = Color(0xFFE6C02D);
  static const lightMustard = Color(0xFFEED45C);
  static const veryPaleYellow = Color(0xFFFBF1BF);
  static const darkGreen = Color(0xFF3E5C32);
  static const green = Color(0xFF87BC65);
  static const lightGreen = Color(0xFFB2D598);
}

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFC3CF3F),
  onPrimary: Color(0xFF2F3300),
  primaryContainer: Color(0xFF454B00),
  onPrimaryContainer: Color(0xFFDFEC59),
  secondary: Color(0xFFC8C9A6),
  onSecondary: Color(0xFF30321A),
  secondaryContainer: Color(0xFF47492E),
  onSecondaryContainer: Color(0xFFE4E5C1),
  tertiary: Color(0xFFFFB875),
  onTertiary: Color(0xFF4B2800),
  tertiaryContainer: Color(0xFF6B3B00),
  onTertiaryContainer: Color(0xFFFFDCC0),
  error: Color(0xFFFFB4AB),
  onError: Color(0xFF690005),
  errorContainer: Color(0xFF93000A),
  onErrorContainer: Color(0xFFFFDAD6),
  outline: Color(0xFF929182),
  background: Color(0xFF1C1C17),
  onBackground: Color(0xFFE5E2DA),
  surface: Color(0xFF14140F),
  onSurface: Color(0xFFC9C6BE),
  surfaceVariant: Color(0xFF47483B),
  onSurfaceVariant: Color(0xFFC8C7B7),
  inverseSurface: Color(0xFFE5E2DA),
  onInverseSurface: Color(0xFF1C1C17),
  inversePrimary: Color(0xFF5C6300),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFC3CF3F),
  outlineVariant: Color(0xFF47483B),
  scrim: Color(0xFF000000),
);

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF5C6300),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFDFEC59),
  onPrimaryContainer: Color(0xFF1B1D00),
  secondary: Color(0xFF5E6044),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE4E5C1),
  onSecondaryContainer: Color(0xFF1B1D07),
  tertiary: Color(0xFF8D4F00),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDCC0),
  onTertiaryContainer: Color(0xFF2D1600),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFFFDAD6),
  onErrorContainer: Color(0xFF410002),
  outline: Color(0xFF787869),
  background: Color(0xFFFEFFD7),
  onBackground: Color(0xFF1C1C17),
  surface: Color(0xFFFCF9F0),
  onSurface: Color(0xFF1C1C17),
  surfaceVariant: Color(0xFFE5E3D2),
  onSurfaceVariant: Color(0xFF47483B),
  inverseSurface: Color(0xFF31312B),
  onInverseSurface: Color(0xFFF4F1E8),
  inversePrimary: Color(0xFFC3CF3F),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF5C6300),
  outlineVariant: Color(0xFFC8C7B7),
  scrim: Color(0xFF000000),
);
