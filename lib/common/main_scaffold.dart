import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/common/widgets/placeholder_widget.dart';
import 'package:nutrisnap/views/auth/signin_page.dart';
// import 'package:nutrisnap/data_models/user_db.dart';
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
import '../../data_models/user_db.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0; // Default value
});

final currentBodyProvider = StateProvider<Widget>((ref) {
  return const DashboardPage(); // Default value
});

class MainScaffold extends ConsumerWidget {
  MainScaffold({super.key});

  static const routeName = '/home';

  final List<Widget> bottomNavPages = [
    const DashboardPage(),
    const JournalPage(),
    const TrendsPage(),
    const ChallengesPage(),
    ProfilePage(),
  ];

  int _onlyBottomNavTitle(int index) {
    if (index > 4) {
      return 0;
    }
    return index;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final currentBody = ref.watch(currentBodyProvider);
    final UserDB userDB = ref.watch(userDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);
    UserData user = userDB.getUser(currentUserID)!;

    Widget getDrawerPage(int index) {
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
          return const SnapsPage();
        case 9:
          return const CoachPage();
        default:
          return const PlaceholderWidget(Color(0xFFF44336), 'Not Found');
      }
    }

    void onBottomTabTapped(int index) {
      ref.read(currentIndexProvider.notifier).state = index;
      ref.read(currentBodyProvider.notifier).state = bottomNavPages[index];
    }

    void onDrawerItemTapped(int index) {
      Navigator.of(context).pop(); // Close the drawer
      ref.read(currentIndexProvider.notifier).state = index;
      ref.read(currentBodyProvider.notifier).state = getDrawerPage(index);
    }
    // void _signOut(BuildContext context) async {
    //   var ctx = Navigator.of(context);
    //   try {
    //     // await FirebaseAuth.instance.signOut(); // Turn this on later
    //     // Optionally navigate the user back to a login screen or another appropriate screen.
    //     ctx.pushReplacementNamed('/');
    //   } catch (error) {
    //     print('Error signing out: $error');
    //   }
    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title is the name of the page
        title: currentIndex == 0
            ? const Text('NutriSnap')
            : currentIndex == 1
                ? const Text('Journal')
                : currentIndex == 2
                    ? const Text('Trends')
                    : currentIndex == 3
                        ? const Text('Challenges')
                        : currentIndex == 4
                            ? const Text('Profile')
                            : currentIndex == 5
                                ? const Text('About')
                                : currentIndex == 6
                                    ? const Text('Admin')
                                    : currentIndex == 7
                                        ? const Text('Friends')
                                        : currentIndex == 8
                                            ? const Text('MySnaps')
                                            : currentIndex == 9
                                                ? const Text('Coach')
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
              Navigator.pushNamed(context, SettingsPage.routeName);
              // ref.read(currentBodyProvider.notifier).state =
              //     const SettingsPage(); // for the settings IconButton
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: currentBody,
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(user.name),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://robohash.org/${user.initials}.png')),
              // UserAvatar(userID: user.id),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () => onDrawerItemTapped(0),
            ),
            ListTile(
              title: const Text('About'),
              leading: const Icon(Icons.info_outline),
              onTap: () => onDrawerItemTapped(5),
            ),
            ListTile(
              title: const Text('Admin'),
              leading: const Icon(Icons.admin_panel_settings_outlined),
              onTap: () => onDrawerItemTapped(6),
            ),
            ListTile(
              title: const Text('Friends'),
              leading: const Icon(Icons.group_outlined),
              onTap: () => onDrawerItemTapped(7),
            ),
            ListTile(
              title: const Text('MySnaps'),
              leading: const Icon(Icons.camera_alt_outlined),
              onTap: () => onDrawerItemTapped(8),
            ),
            ListTile(
              title: const Text('Coach'),
              leading: const Icon(Icons.chat_outlined),
              onTap: () => onDrawerItemTapped(9),
            ),
            const Divider(
              height: 0.2,
            ), // A thick divider to visually separate the above items from the sign-out button
            ListTile(
              title: const Text('Sign Out'),
              // onTap: () => _signOut(context),
              onTap: () =>
                  Navigator.pushReplacementNamed(context, SigninPage.routeName),
              leading: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   onTap: onBottomTabTapped,
      //   currentIndex: _onlyBottomNavTitle(currentIndex),
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.article_outlined), label: 'Journal'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.leaderboard_outlined), label: 'Trends'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.done_outlined), label: 'Challenges'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
      //   ],
      // ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _onlyBottomNavTitle(currentIndex),
        onTap: onBottomTabTapped,
      ),
    );
  }
}

// final currentPageProvider = StateProvider<Widget>((ref) {
//   return const DashboardPage(); // Default value
// });

// class MainScaffold extends ConsumerWidget {
//   MainScaffold({super.key});

//   static const routeName = '/home';

//   final List<Widget> pages = [
//     const DashboardPage(),
//     const JournalPage(),
//     const TrendsPage(),
//     const ChallengesPage(),
//     ProfilePage(),
//     const AboutPage(),
//     const AdminPage(),
//     const FriendsPage(),
//     const SnapsPage(),
//     const CoachPage(),
//   ];

//   final List<String> titles = [
//     'NutriSnap',
//     'Journal',
//     'Trends',
//     'Challenges',
//     'Profile',
//     'About',
//     'Admin',
//     'Friends',
//     'MySnaps',
//     'Coach'
//   ];

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentPage = ref.watch(currentPageProvider);
//     final UserDB userDB = ref.watch(userDBProvider);
//     final String currentUserID = ref.watch(currentUserIDProvider);
//     UserData user = userDB.getUser(currentUserID)!;

//     void onPageChanged(int index) {
//       ref.read(currentPageProvider.notifier).state = pages[index];
//     }

//     int getCurrentIndex() {
//       int index = pages.indexOf(currentPage);
//       if (index == -1 || index >= 5) {
//         return 0; // default index or handle it differently
//       }
//       return index;
//     }

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(titles[getCurrentIndex()]),
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(Icons.menu),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//               tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//             );
//           },
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.pushNamed(context, SettingsPage.routeName);
//               // ref.read(currentPageProvider.notifier).state =
//               //     const SettingsPage();
//             },
//             icon: const Icon(Icons.settings),
//           ),
//         ],
//       ),
//       body: currentPage,
//       drawer: Drawer(
//         child: ListView(
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text(user.name),
//               accountEmail: Text(user.email),
//               currentAccountPicture: CircleAvatar(
//                   backgroundImage: NetworkImage(
//                       'https://robohash.org/${user.initials}.png')),
//               // UserAvatar(userID: user.id),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home_outlined),
//               title: const Text('Home'),
//               onTap: () => onPageChanged(0),
//             ),
//             ListTile(
//               title: const Text('About'),
//               leading: const Icon(Icons.info_outline),
//               onTap: () => onPageChanged(5),
//             ),
//             ListTile(
//               title: const Text('Admin'),
//               leading: const Icon(Icons.admin_panel_settings_outlined),
//               onTap: () => onPageChanged(6),
//             ),
//             ListTile(
//               title: const Text('Friends'),
//               leading: const Icon(Icons.group_outlined),
//               onTap: () => onPageChanged(7),
//             ),
//             ListTile(
//               title: const Text('MySnaps'),
//               leading: const Icon(Icons.camera_alt_outlined),
//               onTap: () => onPageChanged(8),
//             ),
//             ListTile(
//               title: const Text('Coach'),
//               leading: const Icon(Icons.chat_outlined),
//               onTap: () => onPageChanged(9),
//             ),
//             const Divider(
//               height: 0.2,
//             ), // A thick divider to visually separate the above items from the sign-out button
//             ListTile(
//               title: const Text('Sign Out'),
//               // onTap: () => _signOut(context),
//               onTap: () =>
//                   Navigator.pushReplacementNamed(context, SigninPage.routeName),
//               leading: const Icon(Icons.logout),
//             )
//           ], // ... the rest of your drawer code
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onPageChanged,
//         currentIndex: getCurrentIndex(),
//         items: const [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.article_outlined), label: 'Journal'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.leaderboard_outlined), label: 'Trends'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.done_outlined), label: 'Challenges'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          return IconButton(
            icon: Icon(
              _getIconForIndex(index),
              color: currentIndex == index ? Colors.blue : Colors.grey,
            ),
            onPressed: () => onTap(index),
          );
        }),
      ),
    );
  }

  IconData _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.dashboard_outlined;
      case 1:
        return Icons.article_outlined;
      case 2:
        return Icons.leaderboard_outlined;
      case 3:
        return Icons.done_outlined;
      case 4:
        return Icons.account_circle_outlined;
      default:
        return Icons.error; // Just in case
    }
  }
}
