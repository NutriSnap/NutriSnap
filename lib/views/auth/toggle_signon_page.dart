import 'package:flutter/material.dart';
import 'package:nutrisnap/views/auth/login/login_page.dart';
import 'package:nutrisnap/views/auth/register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({Key? key}) : super(key: key);

  static const String routeName = '/intialRoute';

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterScreenState();
}

class _LoginOrRegisterScreenState extends State<LoginOrRegisterPage> {
  bool showLogin = true;

  void toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(
        onTap: toggleView,
      );
    } else {
      return const RegisterPage();
    }
  }
}
