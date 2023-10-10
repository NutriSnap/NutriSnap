import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutrisnap/common/widgets/drawer_view.dart';
// import 'package:nutrisnap/common/widgets/placeholder_widget.dart';
import 'package:nutrisnap/common/widgets/settings_button.dart';
import 'package:nutrisnap/settings/settings_controller.dart';

class AdminPage extends HookConsumerWidget {
  const AdminPage({Key? key}) : super(key: key);
  static const routeName = '/admin';

  // Assuming you have these methods in the original code
  // as they're referred in your provided code snippet
  void _onBottomTabTapped(int index) {
    // Handle bottom tab tap
  }

  int get _currentIndex {
    // Return current index
    return 0; // example value, adjust as needed
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Accessing the settingsProvider directly.
    // final settingsController = ref.watch(settingsProvider);

    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('NutriSnap'),
        actions: const [
          SettingsButton(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: 'Trends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_outlined),
            label: 'Challenges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
