import 'package:flutter/material.dart';
import 'package:nutrisnap/settings/widgets/mindfulness.dart';
import 'package:nutrisnap/settings/widgets/notifications.dart';
import 'settings_controller.dart';
import 'widgets/goals.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.controller.themeMode == ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SwitchListTile(
                title: const Text('Use dark theme'),
                value: isDarkMode,
                onChanged: (bool useDarkTheme) async {
                  await widget.controller.updateThemeMode(
                      useDarkTheme ? ThemeMode.dark : ThemeMode.light);
                  setState(() {
                    isDarkMode = useDarkTheme;
                  });
                },
              ),
              const SizedBox(height: 8),
              const Goals(),
              const SizedBox(height: 8),
              const Notifications(),
              const SizedBox(height: 8),
              const Mindfulness(),
            ],
          )

        ),
      ),
    );
  }
}
