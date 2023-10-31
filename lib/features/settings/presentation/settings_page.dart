import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/features/settings/data/dark_mode_provider.dart';
import 'package:nutrisnap/features/settings/presentation/widgets/goals.dart';
import 'package:nutrisnap/features/settings/presentation/widgets/mindfulness.dart';
import 'package:nutrisnap/features/settings/presentation/widgets/notifications.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static const routeName = '/settings';

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
