import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/views/settings/widgets/mindfulness.dart';
import 'package:nutrisnap/views/settings/widgets/notifications.dart';
import 'package:nutrisnap/views/settings/widgets/goals.dart';
import 'package:nutrisnap/views/settings/dark_mode_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        // add a button to the AppBar that navigates to the settings page.
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
          )
        ],
      ),
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
