import 'package:flutter/material.dart';
import 'package:nutrisnap/common/main_scaffold.dart';
import 'views/settings/settings_controller.dart';
import 'package:nutrisnap/route/router.dart';

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
                    theme: lightTheme,
                    darkTheme: darkTheme,
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

final Color lightPrimary = Color(0xFF76c893); // Avocado green
final Color lightSecondary = Color(0xFFe9dd62); // Avocado yellow
final Color darkPrimary = Color(0xFF4f3222); // Avocado seed brown
final Color darkSecondary = Color(0xFF385a3d); // Darker green

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: lightPrimary,
    secondary: lightSecondary,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
  // Additional theming
);

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: darkPrimary,
    secondary: darkSecondary,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
  // Additional theming
);
