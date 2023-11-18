// import 'package:google_sign_in/google_sign_in.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/profile/domain/user_data.dart';
import 'features/snaps/domain/meal.dart';
import 'features/snaps/domain/snap.dart';
import 'features/snaps/domain/snap_food_item.dart';
import 'firebase_options.dart';
import 'package:nutrisnap/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Check that Freezed data models and json data files are compatible.
Future<bool> verifyInitialData() async {
  // logger.i('Verifying initial data files: Chapter, Garden, News, User');
  //await UserData.checkInitialData();
  await Meal.checkInitialData();
  await Snap.checkInitialData();
  await SnapFoodItem.checkInitialData();
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await verifyInitialData();
  runApp(const ProviderScope(
  child: MyApp(),
  ));
  //runApp(MyApp(SettingsController(SettingsService())));
}