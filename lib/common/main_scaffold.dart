import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/placeholder_widget.dart';
import 'package:nutrisnap/views/settings/settings_controller.dart';
import 'package:nutrisnap/views/settings/settings_page.dart';
import 'package:nutrisnap/views/about/about_page.dart';
import 'package:nutrisnap/views/admin/admin_page.dart';
import 'package:nutrisnap/views/challenges/challenges_page.dart';
import 'package:nutrisnap/views/coach/coach_page.dart';
import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
import 'package:nutrisnap/views/friends/friends_page.dart';
import 'package:nutrisnap/views/journal/journal_page.dart';
import 'package:nutrisnap/views/profile/profile_page.dart';
import 'package:nutrisnap/views/snaps/snaps_page.dart';
import 'package:nutrisnap/views/trends/trends_page.dart';
import 'package:nutrisnap/views/camera/camera_page.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key, required this.controller});

  final SettingsController controller;

  @override
  MainScaffoldState createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  Widget _currentBody = const DashboardPage();

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
      _currentBody = _bottomNavPages[index];
    });
  }

  void _onDrawerItemTapped(int index) {
    Navigator.of(context).pop(); // Close the drawer
    setState(() {
      _currentBody = _getDrawerPage(index);
    });
  }

  Widget _getDrawerPage(int index) {
    switch (index) {
      case 0:
        return const AboutPage();
      case 1:
        return const AdminPage();
      case 2:
        return const CameraPage();
      case 3:
        return const FriendsPage();
      case 4:
        return const SnapsPage();
      case 5:
        return const CoachPage();
      default:
        return const PlaceholderWidget(Color(0xFFF44336), 'Not Found');
    }
  }

  void _signOut() async {
    try {
      // Your sign-out logic here. For example, if you're using Firebase:
      await FirebaseAuth.instance.signOut();

      if (mounted)
      // Optionally, navigate the user to the login page after logging out.
      {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    } catch (error) {
      // Handle logout error, like showing a snackbar with the error message.
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error signing out: $error')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutriSnap'),
        // Provide a button to open the drawer.
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentBody = SettingsPage(controller: widget.controller);
              });
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _currentBody,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Navigation Drawer')),
            ListTile(
              title: const Text('About'),
              onTap: () => _onDrawerItemTapped(0),
            ),
            ListTile(
              title: const Text('Admin'),
              leading: const Icon(Icons.admin_panel_settings_outlined),
              onTap: () => _onDrawerItemTapped(1),
            ),
            ListTile(
              title: const Text('Friends'),
              leading: const Icon(Icons.group_outlined),
              onTap: () => _onDrawerItemTapped(3),
            ),
            ListTile(
              title: const Text('MySnaps'),
              leading: const Icon(Icons.camera_alt_outlined),
              onTap: () => _onDrawerItemTapped(4),
            ),
            ListTile(
              title: const Text('Coach'),
              leading: const Icon(Icons.chat_outlined),
              onTap: () => _onDrawerItemTapped(5),
            ),
            ListTile(
              title: const Text('Extra'),
              onTap: () => _onDrawerItemTapped(6),
            ),
            const Divider(),
            ListTile(
              title: const Text('Sign Out'),
              onTap: _signOut,
              leading: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Changing background color to black
        unselectedItemColor:
            Colors.grey[500], // Making unselected items a bit lighter
        selectedItemColor: Colors.black, // Making selected item white
        onTap: _onBottomTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: 'Journal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined), label: 'Trends'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outlined), label: 'Challenges'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}
