import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nutrisnap/views/about/about_page.dart';
import 'package:nutrisnap/views/admin/admin_page.dart';
import 'package:nutrisnap/views/coach/coach_page.dart';
import 'package:nutrisnap/views/friends/friends_page.dart';
import 'package:nutrisnap/views/snaps/snaps_page.dart';
import 'package:nutrisnap/core/models/user_db.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  void _signOut(BuildContext context) async {
    try {
      // Your sign-out logic here. For example, if you're using Firebase:
      await FirebaseAuth.instance.signOut();

      // Navigate the user to the login page after logging out.
      Navigator.of(context).pushReplacementNamed('/login');
    } catch (error) {
      // Handle logout error, like showing a snackbar with the error message.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing out: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    UserData user = userDB.getUser(currentUserId);
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
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
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
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sign Out'),
            onTap: () => _signOut(context),
          )
        ],
      ),
    );
  }
}
