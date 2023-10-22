import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/views/settings/widgets/mindfulness.dart';
import 'package:nutrisnap/views/settings/widgets/notifications.dart';
import 'settings_controller.dart';
import 'widgets/goals.dart';
import 'package:nutrisnap/views/settings/dark_mode_provider.dart';


class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key,
  //required this.controller
  });

  static const routeName = '/settings';

  //final SettingsController controller;

/*
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

 */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              title: darkMode
                  ? const Text('Switch to light mode')
                  : const Text('Switch to dark mode'),
              value: darkMode,
              onChanged: (val) {
                ref.read(darkModeProvider.notifier).toggle();
                }),
            const SizedBox(height: 8),
            const Goals(),
            const SizedBox(height: 8),
            const Notifications(),
            const SizedBox(height: 8),
            const Mindfulness(),
          ],
        )),
      ),
    );
  }
}
