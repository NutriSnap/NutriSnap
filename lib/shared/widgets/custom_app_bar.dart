// import 'package:flutter/material.dart';
// import 'package:nutrisnap/core/constants/colors.dart';

// class CustomAppBar extends AppBar {



//   CustomAppBar({super.key, Widget? title, List<Widget>? actions})
//       : super(
//           title: title ?? const Text('Home View'),
//                   leading: IconButton(
//             icon: const Icon(Icons.menu),
//             onPressed: () {
//               Navigator.pushNamed(context, '/dashboard');
//             },
//           ),
//           actions: actions ??
//               [
//                 IconButton(
//                   icon: const Icon(Icons.settings),
//                   onPressed: () {
//                     // Here, you may need context to push to settings or any other page
//                     // Navigator.pushNamed(context, '/settings');
//                   },
//                 ),
//               ],
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   AppColors.darkGreen,
//                   AppColors.paleYellow,
//                 ],
//               ),
//             ),
//           ),
//         );
// }


//       // drawer: Drawer(
//       //   child: ListView(
//       //     padding: EdgeInsets.zero,
//       //     children: <Widget>[
//       //       const DrawerHeader(
//       //         decoration: BoxDecoration(
//       //           color: AppColors.darkGreen,
//       //         ),
//       //         child: Text(
//       //           'NutriSnap',
//       //           style: TextStyle(
//       //             color: Colors.white,
//       //             fontSize: 24,
//       //           ),
//       //         ),
//       //       ),
//       //       ListTile(
//       //         title: const Text('Home'),
//       //         onTap: () {
//       //           Navigator.pushNamed(context, '/home');
//       //         },
//       //       ),
//       //       ListTile(
//       //         title: const Text('Dashboard'),
//       //         onTap: () {
//       //           Navigator.pushNamed(context, '/dashboard');
//       //         },
//       //       ),
//       //       ListTile(
//       //         title: const Text('Settings'),
//       //         onTap: () {
//       //           Navigator.pushNamed(context, '/settings');
//       //         },
//       //       ),
//       //     ],
//       //   ),
//       // ),