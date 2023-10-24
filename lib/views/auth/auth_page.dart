// import 'package:flutter/material.dart';
// import 'package:nutrisnap/views/auth/toggle_signon_page.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:nutrisnap/views/dashboard/dashboard_page.dart';

// class AuthPage extends StatelessWidget {
//   const AuthPage({Key? key}) : super(key: key);

//   static const String routeName = '/authenticate';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//           stream: FirebaseAuth.instance.authStateChanges(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return const DashboardPage();
//             } else {
//               return const LoginOrRegisterPage();
//             }
//           }),
//     );
//   }
// }
