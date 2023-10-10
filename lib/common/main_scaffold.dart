import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/bottom_nav_view.dart';
import 'package:nutrisnap/common/widgets/drawer_view.dart';
import 'package:nutrisnap/views/challenges/challenges_page.dart';
import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
import 'package:nutrisnap/views/journal/journal_page.dart';
import 'package:nutrisnap/views/profile/profile_page.dart';
import 'package:nutrisnap/views/trends/trends_page.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  // final SettingsController controller;

  @override
  MainScaffoldState createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  final Widget _currentBody = const DashboardPage();

  final List<Widget> _bottomNavPages = [
    const DashboardPage(),
    const JournalPage(),
    const TrendsPage(),
    const ChallengesPage(),
    const ProfilePage(),
  ];

  void _onBottomTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('NutriSnap'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _bottomNavPages[_currentIndex],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTabSelected: _onBottomTabTapped,
        initialIndex: _currentIndex,
      ),
    );
  }
}
