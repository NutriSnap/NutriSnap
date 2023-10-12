// route_generator.dart
import 'package:flutter/material.dart';
import 'package:nutrisnap/views/about/about_page.dart';
import 'package:nutrisnap/views/admin/admin_page.dart';
import 'package:nutrisnap/views/auth/auth_page.dart';
import 'package:nutrisnap/views/auth/toggle_signon_page.dart';
import 'package:nutrisnap/views/auth/register_page.dart';
import 'package:nutrisnap/views/camera/camera_page.dart';
import 'package:nutrisnap/views/challenges/challenges_page.dart';
import 'package:nutrisnap/views/coach/coach_page.dart';
import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
import 'package:nutrisnap/views/friends/friends_page.dart';
import 'package:nutrisnap/views/journal/journal_page.dart';
import 'package:nutrisnap/views/auth/login/login_page.dart';
import 'package:nutrisnap/views/not_found_page.dart';
import 'package:nutrisnap/views/profile/profile_page.dart';
import 'package:nutrisnap/views/snaps/snaps_page.dart';
import 'package:nutrisnap/views/snaps/edit_snap.dart';
import 'package:nutrisnap/views/trends/trends_page.dart';
import 'package:nutrisnap/views/camera/success_page.dart';
import 'package:nutrisnap/views/settings/settings_page.dart';
import 'package:nutrisnap/views/settings/settings_controller.dart';
import 'package:nutrisnap/views/settings/settings_service.dart';
import 'package:nutrisnap/views/auth/forgot_password_page.dart';
import 'package:nutrisnap/utils/image_upload_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AboutPage.routeName:
        return MaterialPageRoute(builder: (_) => const AboutPage());
      case DashboardPage.routeName:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case LoginOrRegisterPage.routeName:
        return MaterialPageRoute(builder: (_) => const LoginOrRegisterPage());
      case CameraPage.routeName:
        return MaterialPageRoute(builder: (_) => const CameraPage());
      case ChallengesPage.routeName:
        return MaterialPageRoute(builder: (_) => const ChallengesPage());
      case CoachPage.routeName:
        return MaterialPageRoute(builder: (_) => const CoachPage());
      case FriendsPage.routeName:
        return MaterialPageRoute(builder: (_) => const FriendsPage());
      case JournalPage.routeName:
        return MaterialPageRoute(builder: (_) => const JournalPage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (_) => const LoginPage(onTap: null));
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case RegisterPage.routeName:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case ForgotPasswordPage.routeName:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordPage());
      case SnapsPage.routeName:
        return MaterialPageRoute(builder: (_) => const SnapsPage());
      case SettingsPage.routeName:
        return MaterialPageRoute(
            builder: (_) => SettingsPage(
                controller: SettingsController(SettingsService())));
      case SnapsEditPage.routeName:
        return MaterialPageRoute(builder: (_) => const SnapsEditPage());
      case TrendsPage.routeName:
        return MaterialPageRoute(builder: (_) => const TrendsPage());
      case AdminPage.routeName:
        return MaterialPageRoute(builder: (_) => const AdminPage());
      case AuthPage.routeName:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case ImageUploadPage.routeName:
        return MaterialPageRoute(builder: (_) => const ImageUploadPage());
      case SuccessPage.routeName:
        return MaterialPageRoute(builder: (_) => const SuccessPage());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const NotFoundPage();
    });
  }
}
