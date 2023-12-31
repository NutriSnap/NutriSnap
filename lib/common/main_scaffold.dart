import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/fab.dart';

import 'package:nutrisnap/common/widgets/placeholder_widget.dart';
import 'package:nutrisnap/features/profile/domain/user_data.dart';
import 'package:nutrisnap/features/settings/presentation/settings_page.dart';
import 'package:nutrisnap/features/about/presentation/about_page.dart';
import 'package:nutrisnap/features/admin/presentation/admin_page.dart';
import 'package:nutrisnap/features/challenges/presentation/challenges_page.dart';
import 'package:nutrisnap/features/coach/presentation/coach_page.dart';
import 'package:nutrisnap/features/dashboard/presentation/dashboard_page.dart';
import 'package:nutrisnap/features/friends/presentation/friends_page.dart';
import 'package:nutrisnap/features/profile/profile_page.dart';
import 'package:nutrisnap/features/profile/domain/user.dart';
import 'package:nutrisnap/features/snaps/presentation/snaps_page.dart';
import 'package:nutrisnap/features/trends/presentation/trends_page.dart';
import '../features/journal/presentation/journal_page.dart';
import 'package:nutrisnap/features/profile/domain/user_data.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  static const routeName = '/home';

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
      _currentIndex = index;
      _currentBody = _getDrawerPage(index);
    });
  }

  Widget _getDrawerPage(int index) {
    switch (index) {
      case 0:
        return const DashboardPage();
      case 5:
        return const AboutPage();
      case 6:
        return const AdminPage();
      case 7:
        return const FriendsPage();
      case 8:
        return const CoachPage();
      default:
        return const PlaceholderWidget(Color(0xFFF44336), 'Not Found');
    }
  }

  void _signOut() async {
    final ctx = Navigator.of(context);
    final scaffold = ScaffoldMessenger.of(context);
    try {
      // Your sign-out logic here. For example, if you're using Firebase:
      await FirebaseAuth.instance.signOut();
      ctx.pushReplacementNamed('/');
    } catch (error) {
      // Handle logout error, like showing a snackbar with the error message.

      scaffold.showSnackBar(
        SnackBar(content: Text('Error signing out: $error')),
      );
    }
  }

  int _onlyBottomNavTitle(int index) {
    if (index > 4) {
      return 0;
    }
    return index;
  }

  @override
  Widget build(BuildContext context) {
    // User user = FirebaseAuth.instance.currentUser!;
    // String currentUserId = 'user-003';

    //UserData currentUser = userDB.getUser(currentUserId);
    // UserData currentUser = UserData(
    //   id: 'user-003',
    //   name: 'Katie Yamasaki',
    //   username: '@katie',
    //   email: 'katie.y@gmail.com',
    //   imagePath: 'assets/images/user-003.jpg',
    //   initials: 'KY',
    // );

    return Scaffold(
      floatingActionButton: const FAB(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title is the name of the page
        title: _currentIndex == 0
            ? const Text('NutriSnap')
            : _currentIndex == 1
                ? const Text('Journal')
                : _currentIndex == 2
                    ? const Text('Trends')
                    : _currentIndex == 3
                        ? const Text('Challenges')
                        : _currentIndex == 4
                            ? const Text('Profile')
                            : _currentIndex == 5
                                ? const Text('About')
                                : _currentIndex == 6
                                    ? const Text('Admin')
                                    : _currentIndex == 7
                                        ? const Text('Friends')
                                        : _currentIndex == 8
                                            ? const Text('Coach')
                                            : _currentIndex == 9
                                                ? const Text('Settings')
                                                : const Text('NutriSnap'),
        // title: const Text('NutriSnap'),
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
                _currentBody = const SettingsPage();
                _currentIndex = 9;
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
            // UserAccountsDrawerHeader(
            //   accountName: Text(currentUser.name),
            //   accountEmail: Text(currentUser.email),
            //   currentAccountPicture: CircleAvatar(
            //       backgroundImage: NetworkImage(
            //           'https://robohash.org/${currentUser.initials}.png')),
            //   // UserAvatar(userID: user.id),
            // ),
            ListTile(
              leading: const Icon(Icons.dashboard_outlined),
              title: const Text('Dashboard'),
              onTap: () => _onDrawerItemTapped(0),
            ),
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.info_outline),
              onTap: () => _onDrawerItemTapped(5),
            ),
            ListTile(
              title: const Text('Admin'),
              leading: const Icon(Icons.admin_panel_settings_outlined),
              onTap: () => _onDrawerItemTapped(6),
            ),
            ListTile(
              title: const Text('Friends'),
              leading: const Icon(Icons.group_outlined),
              onTap: () => _onDrawerItemTapped(7),
            ),
            ListTile(
              title: const Text('Coach'),
              leading: const Icon(Icons.chat_outlined),
              onTap: () => _onDrawerItemTapped(8),
            ),
            // ListTile(
            //   title: const Text('Extra'),
            //   onTap: () => _onDrawerItemTapped(7),
            // ),
            const Divider(
              height: 0.2,
            ), // A thick divider to visually separate the above items from the sign-out button
            ListTile(
              title: const Text('Sign Out'),
              onTap: _signOut,
              leading: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onBottomTabTapped,
        currentIndex: _onlyBottomNavTitle(_currentIndex),
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
