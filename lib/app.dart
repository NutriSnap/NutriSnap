import 'package:flutter/material.dart';
import 'views/settings/settings_controller.dart';
import 'package:nutrisnap/route/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          key: UniqueKey(),
          debugShowCheckedModeBanner: false,
          title: 'NutriSnap',
          theme: ThemeData(),
          darkTheme: ThemeData.dark(), // could be dark
          themeMode: settingsController.themeMode,
          onGenerateRoute: RouteGenerator.generateRoute,
          // home: MainScaffold(
          //     controller: settingsController), // <== Replace with Login Stuff
          // home: StreamBuilder<User?>(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.active) {
          //       if (snapshot.data == null) {
          //         return LoginPage(onTap: () => {null});
          //       } else {
          //         return MainScaffold(controller: settingsController);
          //         // return const DashboardPage();
          //       }
          //     } else {
          //       // Returning a splash screen while waiting for connection state
          //       return const Scaffold(
          //         body: Center(
          //           child: CircularProgressIndicator(),
          //         ),
          //       );
          //     }
          //   },
          // ),
        );
      },
    );
  }
}



//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<void>(
//         future: settingsController.loadSettings(),
//         builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return ListenableBuilder(
//                 listenable: settingsController,
//                 builder: (BuildContext context, Widget? child) {
//                   return MaterialApp(
//                     debugShowCheckedModeBanner: false,
//                     title: 'NutriSnap',
//                     home: MainScaffold(
//                         controller:
//                             settingsController), // <== Replace with Login Stuff
//                     theme: ThemeData(),
//                     darkTheme: ThemeData.dark(),
//                     themeMode: settingsController.themeMode,
//                     onGenerateRoute: RouteGenerator.generateRoute,
//                   );
//                 });
//           } else if (snapshot.hasError) {
//             return const MaterialApp(
//               home: Scaffold(
//                 body: Center(
//                   child: Text(
//                     'Error loading settings',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               ),
//             );
//           } else {
//             return const MaterialApp(
//               home: Scaffold(
//                 body: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               ),
//             );
//           }
//         });
//   }
// }
