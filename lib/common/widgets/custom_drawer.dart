import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/views/about/about_page.dart';
import 'package:nutrisnap/views/admin/admin_page.dart';
import 'package:nutrisnap/views/coach/coach_page.dart';
import 'package:nutrisnap/views/friends/friends_page.dart';
import 'package:nutrisnap/views/snaps/snaps_page.dart';
import 'package:nutrisnap/data_models/user_db.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  // FirebaseAuth auth = FirebaseAuth.instance;
  // User? user = FirebaseAuth.instance.currentUser;

  final String currentUserId = 'user-003';

  // void _signOut(BuildContext context) async {
  //   final ctx = Navigator.of(context);
  //   final scaffold = ScaffoldMessenger.of(context);
  //   try {
  //     // Your sign-out logic here. For example, if you're using Firebase:
  //     await FirebaseAuth.instance.signOut();
  //     // Navigate the user to the login page after logging out.
  //     ctx.pushReplacementNamed('/signin');
  //   } catch (error) {
  //     // Handle logout error, like showing a snackbar with the error message.
  //     scaffold.showSnackBar(
  //       SnackBar(content: Text('Error signing out: $error')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserDB userDB = ref.watch(userDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);

    /// The currently logged in user.
    UserData user = userDB.getUser(currentUserID)!;
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.name),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://robohash.org/${user.initials}.png')),
            // UserAvatar(userID: user.id),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AboutPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings_outlined),
            title: const Text('Admin'),
            onTap: () {
              Navigator.pushReplacementNamed(context, AdminPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined),
            title: const Text('Friends'),
            onTap: () {
              Navigator.pushReplacementNamed(context, FriendsPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text('MySnaps'),
            onTap: () {
              Navigator.pushReplacementNamed(context, SnapsPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_outlined),
            title: const Text('Coach'),
            onTap: () {
              Navigator.pushReplacementNamed(context, CoachPage.routeName);
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            // onTap: () => _signOut(context),
          )
        ],
      ),
    );
  }
}
