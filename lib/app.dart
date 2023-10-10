import 'package:flutter/material.dart';
import 'package:nutrisnap/common/main_scaffold.dart';
import 'views/settings/settings_controller.dart';
import 'package:nutrisnap/route/router.dart';
import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrisnap/views/auth/toggle_signon_page.dart';

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
                    home: MainScaffold(
                        controller:
                            settingsController), // <== Replace with Login Stuff
                    theme: ThemeData(),
                    darkTheme: ThemeData.dark(),
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
