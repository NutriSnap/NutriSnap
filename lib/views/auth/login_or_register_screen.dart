import 'package:flutter/material.dart';
import 'package:nutrisnap/views/login/login_screen.dart';
import 'package:nutrisnap/views/auth/register_screen.dart';

class LoginOrRegisterScreen extends StatefulWidget {
  const LoginOrRegisterScreen({Key? key}) : super(key: key);

  @override
  State<LoginOrRegisterScreen> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterScreen> {
  bool showLogin = true;

  void toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginScreen(
        onTap: toggleView,
      );
    } else {
      return const RegisterScreen();
    }
  }
}
