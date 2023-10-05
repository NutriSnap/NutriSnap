// import 'package:flutter/material.dart';
// import 'package:nutrisnap/views/challenges/challenges_page.dart';
// import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
// import 'package:nutrisnap/views/journal/journal_page.dart';
// import 'package:nutrisnap/views/trends/trends_page.dart';
// import 'package:nutrisnap/common/widgets/bottom_nav_bar.dart';

// class NavigationDrawer extends StatefulWidget {
//   const NavigationDrawer({super.key});

//   @override
//   State<NavigationDrawer> createState() => _NavigationDrawerState();
// }

// class _NavigationDrawerState extends State<NavigationDrawer> {
//   int currentPageIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text('Drawer Header'),
//             ),
//             ListTile(
//               title: const Text('Item 1'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Item 2'),
//               onTap: () {
//                 // Update the state of the app
//                 // ...
//                 // Then close the drawer
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: IndexedStack(
//         index: currentPageIndex,
//         children: const [
//           DashboardScreen(),
//           JournalScreen(),
//           TrendsScreen(),
//           ChallengesScreen(),
//         ],
//       ),
//       // bottomNavigationBar: customBottomNavBar(),
//     );
//   }

//   NavigationBar customBottomNavBar() {
//     return NavigationBar(
//       onDestinationSelected: (int index) {
//         setState(() {
//           currentPageIndex = index;
//         });
//       },
//       indicatorColor: Colors.amber[800],
//       selectedIndex: currentPageIndex,
//       destinations: const <Widget>[
//         NavigationDestination(
//           selectedIcon: Icon(Icons.dashboard),
//           icon: Icon(Icons.dashboard_outlined),
//           label: 'Dashboard',
//         ),
//         NavigationDestination(
//           icon: Icon(Icons.description_outlined),
//           label: 'Journal',
//         ),
//         NavigationDestination(
//           selectedIcon: Icon(Icons.insert_chart),
//           icon: Icon(Icons.insert_chart_outlined),
//           label: 'Trends',
//         ),
//         NavigationDestination(
//           selectedIcon: Icon(Icons.emoji_events),
//           icon: Icon(Icons.emoji_events_outlined),
//           label: 'Challenges',
//         ),
//       ],
//     );
//   }
// }
