import 'dart:html';

import 'package:flutter/material.dart';

import 'views/settings/widgets/goals.dart';
import 'views/settings/widgets/mindfulness.dart';
import 'views/settings/widgets/notifications.dart';

class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async => ThemeMode.system;

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }
}

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);
  final SettingsService _settingsService;
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({super.key, required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: settingsController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'NutriSnap',
            theme: ThemeData(),
            darkTheme: ThemeData.dark(), // could be dark
            themeMode: settingsController.themeMode,
            home: MainScaffold(controller: settingsController),
            // onGenerateRoute: RouteGenerator.generateRoute,
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case AboutPage.routeName:
                      return const AboutPage();
                    case AdminPage.routeName:
                      return const AdminPage();
                    case CameraPage.routeName:
                      return const CameraPage();
                    case FriendsPage.routeName:
                      return const FriendsPage();
                    case SnapsPage.routeName:
                      return const SnapsPage();
                    case CoachPage.routeName:
                      return const CoachPage();
                    case WelcomePage.routeName:
                      return const WelcomePage();

                    default:
                      return const NotFoundPage();
                  }
                },
              );
            },
          );
        });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String textLabel;
  const PlaceholderWidget(this.color, this.textLabel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          textLabel,
          style: const TextStyle(fontSize: 36, color: Colors.white),
        ),
      ),
    );
  }
}

/// BOTTOM NAVIGATION BAR PAGES
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Dashboard');
  }
}

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Journal');
  }
}

class TrendsPage extends StatelessWidget {
  const TrendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Trends');
  }
}

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Challenges');
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Profile');
  }
}

/// DRAWER PAGES
class AboutPage extends StatelessWidget {
  static const routeName = '/about';

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'About');
  }
}

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});
  static const routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Admin');
  }
}

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  static const routeName = '/camera';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Camera');
  }
}

class CoachPage extends StatelessWidget {
  const CoachPage({super.key});

  static const routeName = '/coach';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Coach');
  }
}

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  static const routeName = '/friends';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Friends');
  }
}

class SnapsPage extends StatelessWidget {
  const SnapsPage({super.key});

  static const routeName = '/snaps';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'MySnaps');
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const routeName = '/welcome';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Welcome');
  }
}

class NotFoundPage extends StatelessWidget {
  static const routeName = '404';

  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Page Not Found!');
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key, required this.controller});

  static const routeName = '/';

  final SettingsController controller;

  @override
  MainScaffoldState createState() => MainScaffoldState();
}

class MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;
  Widget _currentBody = const DashboardPage();

  final List<Widget> _bottomNavPages = [
    const DashboardPage(),
    const JournalPage(),
    const TrendsPage(),
    const ChallengesPage(),
    const ProfilePage(),
  ];

  void _onBottomTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _currentBody = _bottomNavPages[index];
    });
  }

  void _onDrawerItemTapped(int index) {
    Navigator.of(context).pop(); // Close the drawer
    setState(() {
      _currentBody = _getDrawerPage(index);
    });
  }

  Widget _getDrawerPage(int index) {
    switch (index) {
      case 0:
        return const AboutPage();
      case 1:
        return const AdminPage();
      case 2:
        return const CameraPage();
      case 3:
        return const FriendsPage();
      case 4:
        return const SnapsPage();
      case 5:
        return const CoachPage();
      default:
        return const PlaceholderWidget(Color(0xFFF44336), 'Not Found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Example'),
        // Provide a button to open the drawer.
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentBody = SettingsPage(controller: widget.controller);
              });
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _currentBody,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Navigation Drawer')),
            ListTile(
              title: const Text('About'),
              onTap: () => _onDrawerItemTapped(0),
            ),
            ListTile(
              title: const Text('Admin'),
              leading: const Icon(Icons.admin_panel_settings_outlined),
              onTap: () => _onDrawerItemTapped(1),
            ),
            ListTile(
              title: const Text('Friends'),
              leading: const Icon(Icons.group_outlined),
              onTap: () => _onDrawerItemTapped(3),
            ),
            ListTile(
              title: const Text('MySnaps'),
              leading: const Icon(Icons.camera_alt_outlined),
              onTap: () => _onDrawerItemTapped(4),
            ),
            ListTile(
              title: const Text('Coach'),
              leading: const Icon(Icons.chat_outlined),
              onTap: () => _onDrawerItemTapped(5),
            ),
            ListTile(
              title: const Text('Extra'),
              onTap: () => _onDrawerItemTapped(6),
            ),
            const Divider(),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () => {}, // _signOut,
              leading: const Icon(Icons.logout),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black, // Changing background color to black
        unselectedItemColor:
            Colors.grey[500], // Making unselected items a bit lighter
        selectedItemColor: Colors.black, // Making selected item white
        onTap: _onBottomTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: 'Journal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined), label: 'Trends'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_outlined), label: 'Challenges'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
      ),
    );
  }
}

/// EXTENDED PAGES
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  SettingsPageState createState() => SettingsPageState();
}

class UserPrefs {
  bool isDarkMode = false;
  bool isNotificationsEnabled = false;
  bool isMindfulnessEnabled = false;

  void loadSettings() {
    // Load settings from local storage
    UserPrefs prefs = UserPrefs();
    prefs.isDarkMode = true;
    prefs.isNotificationsEnabled = true;
    prefs.isMindfulnessEnabled = true;

    print('Loaded isDarkMode with value ${prefs.isDarkMode}');
    print(
        'Loaded isNotificationsEnabled with value ${prefs.isNotificationsEnabled}');
    print(
        'Loaded isMindfulnessEnabled with value ${prefs.isMindfulnessEnabled}');

    // 1. Load from local storage
  }

  void saveSettings() {
    // Save settings to local storage
    LocalHistoryEntry entry = LocalHistoryEntry(onRemove: () {
      // Save settings to local storage
      MapEntry<String, dynamic> entry = const MapEntry('isDarkMode', true);
      MapEntry<String, dynamic> entry2 =
          const MapEntry('isNotificationsEnabled', true);
      MapEntry<String, dynamic> entry3 =
          const MapEntry('isMindfulnessEnabled', true);

      List<MapEntry<String, dynamic>> entries = [entry, entry2, entry3];
      for (var entry in entries) {
        print('Saving ${entry.key} with value ${entry.value}');
      }
      // 1. Save to local storage
      // 2. Save to remote storage
    });
  }
}

class SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    isDarkMode = widget.controller.themeMode == ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    UserPrefs prefs = UserPrefs();
    prefs.loadSettings();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              title: isDarkMode
                  ? const Text('Switch to light mode')
                  : const Text('Switch to dark mode'),
              value: isDarkMode,
              onChanged: (bool useDarkTheme) async {
                await widget.controller.updateThemeMode(
                    useDarkTheme ? ThemeMode.dark : ThemeMode.light);
                setState(() {
                  isDarkMode = useDarkTheme;
                });
              },
            ),
            const SizedBox(height: 8),
            const Goals(),
            const SizedBox(height: 8),
            const Notifications(),
            const SizedBox(height: 8),
            const Mindfulness(),
          ],
        )),
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(
    MyApp(
      settingsController: settingsController,
    ),
  );
}
