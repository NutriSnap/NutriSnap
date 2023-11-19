// class Setting {
//   Setting({
//     required this.id,
//     required this.userId,
//     required this.theme,
//     required this.notifications,
//     required this.goals,
//     required this.mindfulnessReminders,
//     required this.appFeatures,
//     required this.favoritePages,
//   });
//   String id;
//   String userId;
//   String theme; // e.g., 'light', 'dark'
//   bool notifications;
//   Map<String, dynamic> goals;
//   List<DateTime> mindfulnessReminders; // Reminder times
//   List<String> appFeatures; // Enabled features
//   List<String> favoritePages;
// }

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.freezed.dart';
part 'setting.g.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    required String id,
    required String userId,
    required String theme,
    required bool notifications,
    required Map<String, dynamic> goals,
    required List<DateTime> mindfulnessReminders,
    required List<String> appFeatures,
    required List<String> favoritePages,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) =>
      _$SettingFromJson(json);

  static Future<List<Setting>> getSettings() async {
    final String response =
        await rootBundle.loadString('assets/json/settings.json');
    final List<dynamic> json = jsonDecode(response);
    return json.map((e) => Setting.fromJson(e)).toList();
  }
}
