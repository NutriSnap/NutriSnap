import 'package:flutter/material.dart';
import 'package:nutrisnap/views/about/about_screen.dart';
import 'package:nutrisnap/views/admin/admin_screen.dart';
import 'package:nutrisnap/views/auth/auth_screen.dart';
import 'package:nutrisnap/views/camera/camera_screen.dart';
import 'package:nutrisnap/views/challenges/challenges_screen.dart';
import 'package:nutrisnap/views/coach/coach_screen.dart';
import 'package:nutrisnap/views/dashboard/dashboard_screen.dart';
import 'package:nutrisnap/views/friends/friends_screen.dart';
import 'package:nutrisnap/views/auth/home_screen.dart';
import 'package:nutrisnap/views/journal/journal_screen.dart';
import 'package:nutrisnap/views/login/login_screen.dart';
import 'package:nutrisnap/views/auth/main_screen.dart';
import 'package:nutrisnap/views/not_found_screen.dart';
import 'package:nutrisnap/views/profile/profile_screen.dart';
import 'package:nutrisnap/views/settings/settings_screen.dart';
import 'package:nutrisnap/views/snaps/snaps_screen.dart';
import 'package:nutrisnap/views/trends/trends_screen.dart';

class AppRoutes {
  static const String admin = '/admin';
  static const String auth = '/auth';
  static const String camera = '/camera';
  static const String challenges = '/challenges';
  static const String coach = '/coach';
  static const String dashboard = '/dashboard';
  static const String friends = '/friends';
  static const String home = '/home';
  static const String initialRoute = '/auth';
  static const String journal = '/journal';
  static const String login = '/login';
  static const String main = '/main';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String snaps = '/snaps';
  static const String trends = '/trends';
  static const String about = '/about';

  static const List<String> routes = [
    about,
    admin,
    auth,
    camera,
    challenges,
    coach,
    dashboard,
    friends,
    home,
    initialRoute,
    journal,
    login,
    main,
    profile,
    settings,
    snaps,
    trends,
  ];
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.about:
      return MaterialPageRoute(builder: (context) => const AboutScreen());
    case AppRoutes.admin:
      return MaterialPageRoute(builder: (context) => const AdminScreen());
    case AppRoutes.auth:
      return MaterialPageRoute(builder: (context) => const AuthScreen());
    case AppRoutes.camera:
      return MaterialPageRoute(builder: (context) => const CameraScreen());
    case AppRoutes.challenges:
      return MaterialPageRoute(builder: (context) => const ChallengesScreen());
    case AppRoutes.coach:
      return MaterialPageRoute(builder: (context) => const CoachScreen());
    case AppRoutes.dashboard:
      return MaterialPageRoute(builder: (context) => const DashboardScreen());
    case AppRoutes.friends:
      return MaterialPageRoute(builder: (context) => const FriendsScreen());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case AppRoutes.journal:
      return MaterialPageRoute(builder: (context) => const JournalScreen());
    case AppRoutes.login:
      return MaterialPageRoute(
          builder: (context) => const LoginScreen(onTap: null));
    case AppRoutes.main:
      return MaterialPageRoute(builder: (context) => const MainScreen());
    case AppRoutes.profile:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    case AppRoutes.settings:
      return MaterialPageRoute(builder: (context) => const SettingsScreen());
    case AppRoutes.snaps:
      return MaterialPageRoute(builder: (context) => const SnapsScreen());
    case AppRoutes.trends:
      return MaterialPageRoute(builder: (context) => const TrendsScreen());
    default:
      return MaterialPageRoute(builder: (context) => const NotFoundScreen());
  }
}
