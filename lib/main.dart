import 'package:flutter/material.dart';
import 'package:nutrisnap/core/constants/pallete.dart';
import 'package:firebase_core/firebase_core.dart';

import 'route/router.dart' as router;
import 'firebase_options.dart';
// import 'package:google_sign_in/google_sign_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // await GoogleSignIn().signInSilently();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriSnap',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.lightGreen.shade900),
        useMaterial3: true,
        scaffoldBackgroundColor: Pallete.altBackgroundColor,
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      initialRoute: router.AppRoutes.auth,
      onGenerateRoute: router.generateRoute,
    );
  }
}
