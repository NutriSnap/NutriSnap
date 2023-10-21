import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/*
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
*/

const FlexSchemeData material3FlexScheme = FlexSchemeData(
  name: 'Material 3',
  description: 'Material 3 color scheme',
  light: FlexSchemeColor(
  //brightness: Brightness.light,
  primary: Color(0xFF556500),
  //onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD7ED7C),
  //onPrimaryContainer: Color(0xFF181E00),
  secondary: Color(0xFF5C6145),
  //onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE1E6C3),
  //onSecondaryContainer: Color(0xFF191D08),
  tertiary: Color(0xFF3A665D),
  //onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFBDECE0),
  //onTertiaryContainer: Color(0xFF00201B),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  /*onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFCF4),
  onBackground: Color(0xFF1B1C17),
  surface: Color(0xFFFFFCF4),
  onSurface: Color(0xFF1B1C17),
  surfaceVariant: Color(0xFFE3E3D3),
  onSurfaceVariant: Color(0xFF46483C),
  outline: Color(0xFF77786A),
  onInverseSurface: Color(0xFFF3F1E8),
  inverseSurface: Color(0xFF30312B),
  inversePrimary: Color(0xFFBCD063),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF556500),
  outlineVariant: Color(0xFFC7C8B7),
  scrim: Color(0xFF000000),*/
),
dark: FlexSchemeColor(
  //brightness: Brightness.dark,
  primary: Color(0xFFBCD063),
  //onPrimary: Color(0xFF2B3400),
  primaryContainer: Color(0xFF3F4C00),
  //onPrimaryContainer: Color(0xFFD7ED7C),
  secondary: Color(0xFFC5C9A8),
  //onSecondary: Color(0xFF2E331B),
  secondaryContainer: Color(0xFF454930),
  //onSecondaryContainer: Color(0xFFE1E6C3),
  tertiary: Color(0xFFA1D0C4),
  //onTertiary: Color(0xFF04372F),
  tertiaryContainer: Color(0xFF214E45),
  //onTertiaryContainer: Color(0xFFBDECE0),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  /*onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1B1C17),
  onBackground: Color(0xFFE5E2DA),
  surface: Color(0xFF1B1C17),
  onSurface: Color(0xFFE5E2DA),
  surfaceVariant: Color(0xFF46483C),
  onSurfaceVariant: Color(0xFFC7C8B7),
  outline: Color(0xFF919283),
  onInverseSurface: Color(0xFF1B1C17),
  inverseSurface: Color(0xFFE5E2DA),
  inversePrimary: Color(0xFF556500),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFBCD063),
  outlineVariant: Color(0xFF46483C),
  scrim: Color(0xFF000000),*/
),
);

