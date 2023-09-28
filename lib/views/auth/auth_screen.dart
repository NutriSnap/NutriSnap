import 'package:flutter/material.dart';
import 'package:nutrisnap/views/auth/home_screen.dart';
import 'package:nutrisnap/views/auth/login_or_register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const String routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            } else {
              return const LoginOrRegisterScreen();
            }
          }),
    );
  }
}
