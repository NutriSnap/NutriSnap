import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/common/main_scaffold.dart';
// import 'package:nutrisnap/route/router.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrisnap/views/auth/signin_page.dart';
import 'package:nutrisnap/views/not_found_page.dart';
import 'package:nutrisnap/views/settings/dark_mode_provider.dart';
import 'package:nutrisnap/views/settings/settings_page.dart';

import 'package:nutrisnap/views/about/about_page.dart';
import 'package:nutrisnap/views/admin/admin_page.dart';
// import 'package:nutrisnap/views/auth/auth_page.dart';
// import 'package:nutrisnap/views/auth/register_page.dart';
import 'package:nutrisnap/views/camera/camera_page.dart';
import 'package:nutrisnap/views/challenges/challenges_page.dart';
import 'package:nutrisnap/views/coach/coach_page.dart';
import 'package:nutrisnap/views/dashboard/dashboard_page.dart';
import 'package:nutrisnap/views/friends/friends_page.dart';
import 'package:nutrisnap/views/journal/journal_page.dart';
import 'package:nutrisnap/views/profile/profile_page.dart';
import 'package:nutrisnap/views/snaps/snaps_page.dart';
import 'package:nutrisnap/views/snaps/edit_snap.dart';
import 'package:nutrisnap/views/trends/trends_page.dart';
import 'package:nutrisnap/views/camera/success_page.dart';
import 'package:nutrisnap/views/auth/forgot_password_page.dart';
import 'package:nutrisnap/utils/image_upload_page.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkMode = ref.watch(darkModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriSnap',
      // home: const MainScaffold(),
      theme: FlexThemeData.light(
        useMaterial3: true,
        scheme: FlexScheme.limeM3,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 7,
        //colors: material3FlexScheme.light,
        subThemesData: const FlexSubThemesData(),
        appBarElevation: 1,
        visualDensity: VisualDensity.standard,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        typography: Typography.material2021(platform: defaultTargetPlatform),
      ),
      darkTheme: FlexThemeData.dark(
        useMaterial3: true,
        scheme: FlexScheme.limeM3,
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 7,
        //colors: material3FlexScheme.dark,
        subThemesData: const FlexSubThemesData(),
        appBarElevation: 2,
        visualDensity: VisualDensity.standard,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        typography: Typography.material2021(platform: defaultTargetPlatform),
      ),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case SigninPage.routeName:
                return SigninPage();
              case SettingsPage.routeName:
                return const SettingsPage();
              case AboutPage.routeName:
                return const AboutPage();
              case AdminPage.routeName:
                return const AdminPage();
              // case AuthPage.routeName:
              //   return const AuthPage();
              // case RegisterPage.routeName:
              //   return const RegisterPage();
              // case LoginPage.routeName:
              //   return const LoginPage();
              case ForgotPasswordPage.routeName:
                return const ForgotPasswordPage();
              // case ToggleSignonPage.routeName:
              //   return const ToggleSignonPage();
              case CameraPage.routeName:
                return const CameraPage();
              case ChallengesPage.routeName:
                return const ChallengesPage();
              case CoachPage.routeName:
                return const CoachPage();
              case DashboardPage.routeName:
                return const DashboardPage();
              case FriendsPage.routeName:
                return const FriendsPage();
              case JournalPage.routeName:
                return const JournalPage();
              case ProfilePage.routeName:
                return const ProfilePage();
              case SnapsPage.routeName:
                return const SnapsPage();
              case SnapsEditPage.routeName:
                return const SnapsEditPage();
              case TrendsPage.routeName:
                return const TrendsPage();
              case ImageUploadPage.routeName:
                return const ImageUploadPage();
              case SuccessPage.routeName:
                return const SuccessPage();
              case MainScaffold.routeName:
                return const MainScaffold();
              default:
                return const NotFoundPage();
            }
          },
        );
      },
      // onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
