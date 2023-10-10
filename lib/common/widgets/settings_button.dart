import 'package:flutter/material.dart';
import 'package:nutrisnap/settings/settings_page.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushReplacementNamed(
          context,
          SettingsPage.routeName,
        );
      },
      icon: const Icon(Icons.settings),
    );
  }
}
