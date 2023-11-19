import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'decorations.dart';

/// Builds the page to handle a forgotten password.
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static const routeName = '/forgot-password';

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return ForgotPasswordScreen(
      email: arguments?['email'],
      headerMaxExtent: 200,
      headerBuilder: headerIcon(Icons.lock),
      sideBuilder: sideIcon(Icons.lock),
    );
  }
}
