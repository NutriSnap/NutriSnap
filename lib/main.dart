import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'features/snaps/domain/snap.dart';
// import 'features/snaps/domain/snap_food_item.dart';
import 'firebase_options.dart';
import 'package:nutrisnap/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Check that Freezed data models and json data files are compatible.
Future<bool> verifyInitialData() async {
  return true;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
  await verifyInitialData();
  runApp(const ProviderScope(child: MyApp()));
}
