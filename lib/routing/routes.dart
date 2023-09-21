import 'package:flutter/material.dart';
import 'package:nutrisnap/views/dashboard/dashboard_view.dart';
// import 'package:nutrisnap/views/journal/journal_view.dart';
// import 'package:nutrisnap/views/trends/trends_view.dart';
// import 'package:nutrisnap/views/camera/camera_view.dart';
// import 'package:nutrisnap/views/snapshots/snapshots_view.dart';
// import 'package:nutrisnap/views/challenges/challenges_view.dart';
// import 'package:nutrisnap/views/profile/profile_view.dart';
// import 'package:nutrisnap/views/friends/friends_view.dart';
// import 'package:nutrisnap/views/coach/coach_view.dart';
// import 'package:nutrisnap/views/settings/settings_view.dart';
// import 'package:nutrisnap/views/admin/admin_view.dart';

class AppRoutes {
  static const dashboard = '/dashboard';
  static const journal = '/journal';
  static const trends = '/trends';
  static const camera = '/camera';
  static const snapshots = '/snapshots';
  static const challenges = '/challenges';
  static const profile = '/profile';
  static const friends = '/friends';
  static const coach = '/coach';
  static const settings = '/settings';
  static const admin = '/admin';

  static Map<String, WidgetBuilder> all() {
    return {
      dashboard: (ctx) => const DashboardView(),
      // journal: (ctx) => JournalView(),
      // trends: (ctx) => TrendsView(),
      // camera: (ctx) => CameraView(),
      // snapshots: (ctx) => SnapshotsView(),
      // challenges: (ctx) => ChallengesView(),
      // profile: (ctx) => ProfileView(),
      // friends: (ctx) => FriendsView(),
      // coach: (ctx) => CoachView(),
      // settings: (ctx) => SettingsView(),
      // admin: (ctx) => AdminView(),
    };
  }
}
