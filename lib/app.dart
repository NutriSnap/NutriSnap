import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/common/main_scaffold.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'views/settings/settings_controller.dart';
import 'package:nutrisnap/route/router.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrisnap/views/settings/dark_mode_provider.dart';

class MyApp extends ConsumerWidget {
  //final SettingsController settingsController;
  //const MyApp(this.settingsController, {Key? key}) : super(key: key);
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriSnap',
      home: const MainScaffold(
        //controller: settingsController
      ),
      theme: FlexThemeData.light(
        useMaterial3: true,
        scheme: FlexScheme.limeM3,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 7,
        //colors: material3FlexScheme.light,
        subThemesData: const FlexSubThemesData(),
        appBarElevation: 1,
        visualDensity: VisualDensity.standard,
        fontFamily: GoogleFonts
            .notoSans()
            .fontFamily,
        typography: Typography.material2021(platform: defaultTargetPlatform),
      ),
      darkTheme: FlexThemeData.dark(
        useMaterial3: true,
        scheme: FlexScheme.limeM3,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 7,
        //colors: material3FlexScheme.dark,
        subThemesData: const FlexSubThemesData(),
        appBarElevation: 2,
        visualDensity: VisualDensity.standard,
        fontFamily: GoogleFonts
            .notoSans()
            .fontFamily,
        typography: Typography.material2021(platform: defaultTargetPlatform),
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}