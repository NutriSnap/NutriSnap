import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nutrisnap/common/main_scaffold.dart';
import 'package:nutrisnap/common/themes.dart';
import 'package:nutrisnap/route/router.dart';
import 'package:nutrisnap/settings/theme_provider.dart';

// class MyApp extends HookConsumerWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final settingsController = ref.watch(settingsProvider);

//     return FutureBuilder<void>(
//       future: settingsController.loadSettings(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return MaterialApp(
//             key: ValueKey(settingsController.themeMode),
//             debugShowCheckedModeBanner: false,
//             title: 'NutriSnap',
//             home: MainScaffold(controller: settingsController),
//             theme: ThemeData(),
//             darkTheme: ThemeData.dark(),
//             themeMode: settingsController.themeMode,
//             onGenerateRoute: RouteGenerator.generateRoute,
//             initialRoute: '/', // goes to auth page
//           );
//         } else if (snapshot.hasError) {
//           return const MaterialApp(
//             home: Scaffold(
//               body: Center(
//                 child: Text('Error loading settings'),
//               ),
//             ),
//           );
//         } else {
//           // This is displayed while `loadSettings` Future is in progress.
//           return const MaterialApp(
//             home: Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    final appThemeState = ref.watch(appThemeStateNotifier);
    // final settingsController = ref.watch(settingsProvider);

    // if (!settingsController.isSettingsLoaded) {
    //   return const MaterialApp(
    //     home: Scaffold(
    //       body: Center(child: CircularProgressIndicator()),
    //     ),
    //   );
    // }

    return MaterialApp(
      // key: ValueKey(settingsController.themeMode),
      debugShowCheckedModeBanner: false,
      title: 'NutriSnap',
      home: const MainScaffold(),
      // theme: ThemeData(),
      // darkTheme: ThemeData.dark(),
      // themeMode: settingsController.themeMode,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode:
          appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: RouteGenerator.generateRoute,
      // on load, if the user is logged in, go directly to the dashboard
      // otherwise, go to the auth page
      initialRoute: '/', // goes to auth page
    );
  }
}
