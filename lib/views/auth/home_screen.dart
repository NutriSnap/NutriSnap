import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';
import 'package:nutrisnap/views/account/account_screen.dart';
import 'package:nutrisnap/views/challenges/challenges_screen.dart';
import 'package:nutrisnap/views/dashboard/dashboard_screen.dart';
import 'package:nutrisnap/views/journal/journal_screen.dart';
import 'package:nutrisnap/views/trends/trends_screen.dart';
import 'package:nutrisnap/views/login/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  late PageController _pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPageIndex);
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();

    if (mounted) {
      setState(() {
        currentPageIndex = 0;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => LoginScreen(onTap: () {
                    true;
                  })),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutriSnap'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
        ],
      ),
      drawer: NavigationDrawer(
        onPageSelected: (int page) {
          _pageController.jumpToPage(page);
          setState(() {
            currentPageIndex = page;
          });
        },
        onSignOut: signOut, // Pass the signOut function here
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          DashboardScreen(),
          JournalScreen(),
          TrendsScreen(),
          ChallengesScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: currentPageIndex,
        onItemSelected: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class NavigationDrawer extends StatelessWidget {
  final Function(int) onPageSelected;
  final VoidCallback onSignOut;

  const NavigationDrawer({
    Key? key,
    required this.onPageSelected,
    required this.onSignOut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'NutriSnap',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_outlined),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.of(context).pop();
              onPageSelected(0);
            },
          ),
          ListTile(
            leading: const Icon(Icons.article_outlined),
            title: const Text('Journal'),
            onTap: () {
              Navigator.of(context).pop();
              onPageSelected(1);
            },
          ),
          ListTile(
            leading: const Icon(Icons.leaderboard_outlined),
            title: const Text('Trends'),
            onTap: () {
              Navigator.of(context).pop();
              onPageSelected(2);
            },
          ),
          ListTile(
            leading: const Icon(Icons.done_outlined),
            title: const Text('Challenges'),
            onTap: () {
              Navigator.of(context).pop();
              onPageSelected(3);
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle_outlined),
            title: const Text('Account'),
            onTap: () {
              Navigator.of(context).pop();
              onPageSelected(4);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              onSignOut();
            },
          ),
        ],
      ),
    );
  }
}

class PlaceholderPage extends StatelessWidget {
  final String title;

  const PlaceholderPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // adjust as per your requirement
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.9),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onItemSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 4,
                    color: isSelected
                        ? AppColors.ultraprocessedPurple
                        : Colors.transparent,
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isSelected ? item.activeIcon : item.icon,
                    // color: isSelected ? AppColors.gold : Colors.grey,
                    // size: 24,
                  ),
                  if (isSelected)
                    Text(
                      item.label,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class CustomNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;

  CustomNavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
}

var items = [
  CustomNavItem(
    icon: Icons.dashboard_outlined,
    activeIcon: Icons.dashboard,
    label: 'Dashboard',
  ),
  CustomNavItem(
    icon: Icons.article_outlined,
    activeIcon: Icons.article,
    label: 'Journal',
  ),
  CustomNavItem(
    icon: Icons.leaderboard_outlined,
    activeIcon: Icons.leaderboard,
    label: 'Trends',
  ),
  CustomNavItem(
    icon: Icons.done_outlined,
    activeIcon: Icons.done,
    label: 'Challenges',
  ),
  CustomNavItem(
    icon: Icons.account_circle_outlined,
    activeIcon: Icons.account_circle,
    label: 'Account',
  ),
];
