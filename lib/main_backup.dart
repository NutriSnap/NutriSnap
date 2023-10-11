// import 'package:google_sign_in/google_sign_in.dart';

import 'package:flutter/material.dart';
import 'package:nutrisnap/app.dart';
import 'package:nutrisnap/views/settings/settings_controller.dart';
import 'package:nutrisnap/views/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}
