// // import 'package:flutter/material.dart';

// // /// A service that stores and retrieves user settings.
// // ///
// // /// By default, this class does not persist user settings. If you'd like to
// // /// persist the user settings locally, use the shared_preferences package. If
// // /// you'd like to store settings on a web server, use the http package.
// // class SettingsService {
// //   /// Loads the User's preferred ThemeMode from local or remote storage.
// //   Future<ThemeMode> themeMode() async => ThemeMode.system;

// //   /// Persists the user's preferred ThemeMode to local or remote storage.
// //   Future<void> updateThemeMode(ThemeMode theme) async {
// //     // Use the shared_preferences package to persist settings locally or the
// //     // http package to persist settings over the network.
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SettingsService {
//   /// Loads the User's preferred ThemeMode from local storage.
//   Future<ThemeMode> themeMode() async {
//     final prefs = await SharedPreferences.getInstance();
//     final isDarkMode = prefs.getBool('isDarkMode') ?? false;
//     return isDarkMode ? ThemeMode.dark : ThemeMode.light;
//   }

//   /// Persists the user's preferred ThemeMode to local storage.
//   Future<void> updateThemeMode(ThemeMode theme) async {
//     final prefs = await SharedPreferences.getInstance();
//     bool isDarkMode;
//     switch (theme) {
//       case ThemeMode.dark:
//         isDarkMode = true;
//         break;
//       default:
//         isDarkMode = false;
//         break;
//     }
//     await prefs.setBool('isDarkMode', isDarkMode);
//   }
// }
