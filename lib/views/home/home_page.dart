import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/custom_drawer.dart';
import 'package:nutrisnap/views/challenges/challenges_page.dart';
import 'package:nutrisnap/views/coach/coach_page.dart';
import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
import 'package:nutrisnap/views/journal/journal_page.dart';
import 'package:nutrisnap/views/profile/profile_page.dart';
import 'package:nutrisnap/views/settings/settings_page.dart';
import 'package:nutrisnap/views/trends/trends_page.dart';

/// Top-level Layout for all of the "Home" related
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  static const routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const DashboardPage(),
      const JournalPage(),
      const TrendsPage(),
      const ChallengesPage(),
      const ProfilePage(),
      // const CameraPage(),
      const CoachPage(),
      // const AboutPage(),
      // const AdminPage(),
      // const SnapsPage(),
    ];

    final bottomNavItems = [
      const BottomNavigationBarItem(
          label: 'Dashboard', icon: Icon(Icons.dashboard)),
      const BottomNavigationBarItem(label: 'Journal', icon: Icon(Icons.book)),
      const BottomNavigationBarItem(
          label: 'Trends', icon: Icon(Icons.trending_up)),
      const BottomNavigationBarItem(
          label: 'Challenges', icon: Icon(Icons.emoji_events)),
      const BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
      // ... more items if needed
    ];
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [SettingsButton()],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomNavItems,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.pushReplacementNamed(context, SettingsPage.routeName);
      },
    );
  }
}
