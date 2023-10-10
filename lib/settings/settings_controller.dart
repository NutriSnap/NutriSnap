// // settings_controller.dart
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'settings_service.dart';

// final settingsProvider = Provider<SettingsController>((ref) {
//   return SettingsController(SettingsService())..loadSettings();
// });

// class SettingsController extends ChangeNotifier {
//   final SettingsService _settingsService;
//   late ThemeMode _themeMode;
//   bool _isSettingsLoaded = false;

//   SettingsController(this._settingsService);

//   ThemeMode get themeMode => _themeMode;
//   bool get isSettingsLoaded => _isSettingsLoaded;

//   Future<void> loadSettings() async {
//     _themeMode = await _settingsService.themeMode();
//     _isSettingsLoaded = true;
//     notifyListeners();
//   }

//   Future<void> updateThemeMode(ThemeMode newThemeMode) async {
//     if (newThemeMode == _themeMode) return;
//     _themeMode = newThemeMode;
//     notifyListeners();
//     await _settingsService.updateThemeMode(newThemeMode);
//   }
// }
