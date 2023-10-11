import 'package:flutter/material.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';
import 'package:nutrisnap/views/challenges/challenges_page.dart';
import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
import 'package:nutrisnap/views/journal/journal_page.dart';
import 'package:nutrisnap/views/profile/profile_page.dart';
import 'package:nutrisnap/views/trends/trends_page.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex = 0;
  // Widget _currentBody = const DashboardPage();

  final List<String> _bottomNavPages = [
    DashboardPage.routeName,
    JournalPage.routeName,
    TrendsPage.routeName,
    ChallengesPage.routeName,
    ProfilePage.routeName,

    // const DashboardPage(),
    // const JournalPage(),
    // const TrendsPage(),
    // const ChallengesPage(),
    // const ProfilePage(),
  ];

  // void _onBottomTabTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //     // _currentBody = _bottomNavPages[index];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          DashboardPage(),
          JournalPage(),
          TrendsPage(),
          ChallengesPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        // onDestinationSelected: _onBottomTabTapped,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
            Navigator.of(context).pushNamed(
              _bottomNavPages[index],
            );
          });
        },
        indicatorColor: AppColors.gold,
        selectedIndex: _currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            selectedIcon: Icon(Icons.article),
            label: 'Journal',
          ),
          NavigationDestination(
            icon: Icon(Icons.leaderboard_outlined),
            selectedIcon: Icon(Icons.leaderboard),
            label: 'Trends',
          ),
          NavigationDestination(
            icon: Icon(Icons.done_outlined),
            selectedIcon: Icon(Icons.done),
            label: 'Challenges',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle_outlined),
            selectedIcon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
