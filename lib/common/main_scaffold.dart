// import 'package:flutter/material.dart';
// import 'package:nutrisnap/common/widgets/custom_drawer.dart';
// import 'package:nutrisnap/views/settings/settings_controller.dart';
// import 'package:nutrisnap/views/settings/settings_page.dart';
// import 'package:nutrisnap/views/about/about_page.dart';
// import 'package:nutrisnap/views/admin/admin_page.dart';
// import 'package:nutrisnap/views/challenges/challenges_page.dart';
// import 'package:nutrisnap/views/coach/coach_page.dart';
// import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
// import 'package:nutrisnap/views/friends/friends_page.dart';
// import 'package:nutrisnap/views/journal/journal_page.dart';
// import 'package:nutrisnap/views/profile/profile_page.dart';
// import 'package:nutrisnap/views/snaps/snaps_page.dart';
// import 'package:nutrisnap/views/trends/trends_page.dart';

// class MainScaffold extends StatefulWidget {
//   const MainScaffold({super.key, required this.controller});

//   final Widget body = const DashboardPage(); // <== Default to DashboardPage()

//   final SettingsController controller;

//   @override
//   MainScaffoldState createState() => MainScaffoldState();
// }

// class MainScaffoldState extends State<MainScaffold> {
//   int _currentIndex = 0;
//   Widget _currentBody = const DashboardPage();

//   final List<Widget> _allPages = [
//     const DashboardPage(),
//     const JournalPage(),
//     const TrendsPage(),
//     const ChallengesPage(),
//     const ProfilePage(),
//     const FriendsPage(),
//     const SnapsPage(),
//     const CoachPage(),
//     const AdminPage(),
//     const AboutPage(),
//   ];

//   void onDestinationSelected(int index) {
//     setState(() {
//       _currentIndex = index;
//       _currentBody = _allPages[index];
//     });
//   }

//   // void _onBottomTabTapped(int index) {
//   //   setState(() {
//   //     _currentIndex = index;
//   //     _currentBody = _bottomNavPages[index];
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(controller: widget.controller),
//       body: _currentBody,
//       drawer: CustomDrawer(),
//       bottomNavigationBar: MyBottomNavigationBar(
//         onTap: onDestinationSelected,
//         currentIndex: _currentIndex,
//         items: _bottomNavItems,
//       ),
//     );
//   }
// }

// class MyBottomNavigationBar extends StatelessWidget {
//   const MyBottomNavigationBar(
//       {super.key,
//       required this.onTap,
//       required this.currentIndex,
//       required this.items,
//       this.elevation = 8.0});
//   final double elevation;

//   final void Function(int) onTap;
//   final int currentIndex;
//   final List<BottomNavigationBarItem> items;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       unselectedItemColor: Theme.of(context).colorScheme.onSurface,
//       selectedItemColor: Theme.of(context).colorScheme.onSurface,
//       onTap: onTap,
//       currentIndex: currentIndex,
//       items: _bottomNavItems,
//     );
//   }
// }

// // final List<Widget> _bottomNavPages = [
// //   const DashboardPage(),
// //   const JournalPage(),
// //   const TrendsPage(),
// //   const ChallengesPage(),
// //   const ProfilePage(),
// // ];

// const List<BottomNavigationBarItem> _bottomNavItems = [
//   BottomNavigationBarItem(
//       icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
//   BottomNavigationBarItem(icon: Icon(Icons.article_outlined), label: 'Journal'),
//   BottomNavigationBarItem(
//       icon: Icon(Icons.leaderboard_outlined), label: 'Trends'),
//   BottomNavigationBarItem(icon: Icon(Icons.done_outlined), label: 'Challenges'),
//   BottomNavigationBarItem(
//       icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
// ];

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => const Size.fromHeight(56.0);

//   const CustomAppBar({super.key, required this.controller});

//   final SettingsController controller;

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: const Text('NutriSnap'),
//       actions: [
//         IconButton(
//           icon: const Icon(Icons.settings),
//           onPressed: () {
//             Navigator.pop(context);
//             Navigator.pushNamed(context, SettingsPage.routeName,
//                 arguments: controller);
//           },
//         ),
//       ],
//     );
//   }
// }
