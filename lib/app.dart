import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nutrisnap/common/main_scaffold.dart';
import 'views/settings/settings_controller.dart';
import 'package:nutrisnap/route/router.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';


class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp(this.settingsController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: settingsController.loadSettings(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListenableBuilder(
                listenable: settingsController,
                builder: (BuildContext context, Widget? child) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'NutriSnap',
                    home: MainScaffold(controller: settingsController),
                    // theme: ThemeData(),
                    // darkTheme: ThemeData.dark(),
                    theme: FlexThemeData.light(
                      useMaterial3: true,
                      scheme: FlexScheme.limeM3,
                      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
                      blendLevel: 7,
                      //colors: material3FlexScheme.light,
                      subThemesData: const FlexSubThemesData(),
                      appBarElevation: 1,
                      visualDensity: VisualDensity.standard,
                      fontFamily: GoogleFonts.notoSans().fontFamily,
                      // We use the nicer Material-3 Typography in both M2 and M3 mode.
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
                      fontFamily: GoogleFonts.notoSans().fontFamily,
                      typography: Typography.material2021(platform: defaultTargetPlatform),
                    ),
                    themeMode: settingsController.themeMode,
                    onGenerateRoute: RouteGenerator.generateRoute,
                  );
                });
          } else if (snapshot.hasError) {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text(
                    'Error loading settings',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            );
          } else {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}