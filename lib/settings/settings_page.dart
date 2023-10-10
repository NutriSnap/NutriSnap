import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutrisnap/settings/widgets/dark_mode_switch.dart';
import 'package:nutrisnap/settings/widgets/goals.dart';
import 'package:nutrisnap/settings/widgets/mindfulness.dart';
import 'package:nutrisnap/settings/widgets/notifications.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DarkModeSwitch(),

              // Consumer(builder: (context, ref, child) {
              //   final settingsController = ref.watch(settingsProvider);
              //   bool isDarkMode =
              //       settingsController.themeMode == ThemeMode.dark;
              //   return SwitchListTile(
              //     title: const Text('Use dark theme'),
              //     value: isDarkMode,
              //     onChanged: (bool useDarkTheme) {
              //       settingsController.updateThemeMode(
              //         useDarkTheme ? ThemeMode.dark : ThemeMode.light,
              //       );
              //     },
              //   );
              // }),
              SizedBox(height: 8),
              Goals(),
              SizedBox(height: 8),
              Notifications(),
              SizedBox(height: 8),
              Mindfulness(),
            ],
          ),
        ),
      ),
    );
  }
}
