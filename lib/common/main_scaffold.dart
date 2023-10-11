import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/placeholder_widget.dart';
import 'package:nutrisnap/data_models/user_db.dart';
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
        return const DashboardPage();
      case 1:
        return const AboutPage();
      case 2:
        return const AdminPage();
      case 3:
        return const CameraPage();
      case 4:
        return const FriendsPage();
      case 5:
        return const SnapsPage();
      case 6:
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
      ctx.pushReplacementNamed('/login');
    } catch (error) {
      // Handle logout error, like showing a snackbar with the error message.

      scaffold.showSnackBar(
        SnackBar(content: Text('Error signing out: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // User user = FirebaseAuth.instance.currentUser!;

    UserData currentUser = userDB.getUser(currentUserId);

    return Scaffold(
      appBar: AppBar(
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
                            : const Text('NutriSnap'),
        // title: const Text('NutriSnap'),
        backgroundColor: Colors.green,
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
            UserAccountsDrawerHeader(
              accountName: Text(currentUser.name),
              accountEmail: Text(currentUser.email),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://robohash.org/${currentUser.initials}.png')),
              // UserAvatar(userID: user.id),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => _onDrawerItemTapped(0),
            ),
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.info_outline),
              onTap: () => _onDrawerItemTapped(1),
            ),
            ListTile(
              title: const Text('Admin'),
              leading: const Icon(Icons.admin_panel_settings_outlined),
              onTap: () => _onDrawerItemTapped(2),
            ),
            ListTile(
              title: const Text('Camera'),
              leading: const Icon(Icons.group_outlined),
              onTap: () => _onDrawerItemTapped(3),
            ),
            ListTile(
              title: const Text('Friends'),
              leading: const Icon(Icons.group_outlined),
              onTap: () => _onDrawerItemTapped(4),
            ),
            ListTile(
              title: const Text('MySnaps'),
              leading: const Icon(Icons.camera_alt_outlined),
              onTap: () => _onDrawerItemTapped(5),
            ),
            ListTile(
              title: const Text('Coach'),
              leading: const Icon(Icons.chat_outlined),
              onTap: () => _onDrawerItemTapped(6),
            ),
            // ListTile(
            //   title: const Text('Extra'),
            //   onTap: () => _onDrawerItemTapped(7),
            // ),
            const Divider(
              color: Colors.black,
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
