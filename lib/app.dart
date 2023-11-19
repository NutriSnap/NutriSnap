import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/common/main_scaffold.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nutrisnap/features/auth/presentation/signin_page.dart';
import 'package:nutrisnap/features/journal/presentation/journal_page.dart';
import 'package:nutrisnap/features/not_found_page.dart';
import 'package:nutrisnap/features/settings/data/dark_mode_provider.dart';
import 'package:nutrisnap/features/settings/presentation/settings_page.dart';
import 'package:nutrisnap/features/about/presentation/about_page.dart';
import 'package:nutrisnap/features/admin/presentation/admin_page.dart';
import 'package:nutrisnap/features/camera/presentation/camera_page.dart';
import 'package:nutrisnap/features/challenges/presentation/challenges_page.dart';
import 'package:nutrisnap/features/coach/presentation/coach_page.dart';
import 'package:nutrisnap/features/dashboard/presentation/dashboard_page.dart';
import 'package:nutrisnap/features/friends/presentation/friends_page.dart';
import 'package:nutrisnap/features/profile/profile_page.dart';
import 'package:nutrisnap/features/snaps/presentation/snaps_page.dart';
import 'package:nutrisnap/features/snaps/presentation/edit_snap.dart';
import 'package:nutrisnap/features/trends/presentation/trends_page.dart';
import 'package:nutrisnap/features/camera/presentation/success_page.dart';
import 'package:nutrisnap/utils/image_upload_page.dart';

import 'features/auth/presentation/register_page.dart';

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
              case RegisterPage.routeName:
                return const RegisterPage();
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
