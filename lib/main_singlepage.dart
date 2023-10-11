import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();
  runApp(MyApp(settingsController: settingsController));
}

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
  const MyApp({super.key, required this.settingsController});

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // set a custom theme based on a color seed
          theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow)),
          title: 'NutriSnap',
          // theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          home: const NavigationController(),
          debugShowCheckedModeBanner: false,
          themeMode: settingsController.themeMode,
        );
      },
    );
  }
}

class NavigationController extends StatefulWidget {
  const NavigationController({super.key});

  @override
  NavigationControllerState createState() => NavigationControllerState();
}

class NavigationControllerState extends State<NavigationController> {
  int _currentIndex = 0;

  void _setIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildNavigator(const DashboardPage()),
          _buildNavigator(const JournalPage()),
          _buildNavigator(const TrendsPage()),
          _buildNavigator(const ChallengesPage()),
          _buildNavigator(const ProfilePage()),
          // other pages
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Do we want to add custom colors here?
        backgroundColor:
            Theme.of(context).secondaryHeaderColor, // Set background color
        selectedItemColor: Theme.of(context).primaryColor, // Set text color
        unselectedItemColor: Theme.of(context).disabledColor, // Set text color
        currentIndex: _currentIndex,
        onTap: _setIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), label: 'Journal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard_outlined), label: 'Trends'),
          BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_outlined), label: 'Challenges'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: 'Profile'),
          // other BottomNavigationBarItem
        ],
      ),
    );
  }

  Navigator _buildNavigator(Widget page) {
    return Navigator(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => page,
        );
      },
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JournalPage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('JournalPage'),
      ),
    );
  }
}

class TrendsPage extends StatelessWidget {
  const TrendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrendsPage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('TrendsPage'),
      ),
    );
  }
}

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChallengesPage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('ChallengesPage'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfilePage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('ProfilePage'),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutPage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('AboutPage'),
      ),
    );
  }
}

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdminPage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('AdminPage'),
      ),
    );
  }
}

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FriendsPage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('FriendsPage'),
      ),
    );
  }
}

class SnapsPage extends StatelessWidget {
  const SnapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnapsPage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('SnapsPage'),
      ),
    );
  }
}

class CoachPage extends StatelessWidget {
  const CoachPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoachPage'),
        actions: const [SettingsButton()],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('CoachPage'),
      ),
    );
  }
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.imagePath,
    required this.initials,
  });
  String id;
  String name;
  String username;
  String email;
  String? imagePath;
  String initials;
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    UserData user = UserData(
      id: 'user-001',
      name: 'Jenna Deane',
      username: '@fluke',
      email: 'jennacorindeane@gmail.com',
      imagePath: 'assets/images/user-001.jpg',
      initials: 'JD',
    );

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.name),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://robohash.org/${user.initials}.png')),
            // UserAvatar(userID: user.id),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings_outlined),
            title: const Text('Admin'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const AdminPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.group_outlined),
            title: const Text('Friends'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const FriendsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt_outlined),
            title: const Text('MySnaps'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SnapsPage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat_outlined),
            title: const Text('Coach'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const CoachPage()),
              );
            },
          ),
          // other ListTiles
          const Divider(),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sign Out'),
            // onTap: () => {_signOut(context)},
          )
        ],
      ),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        // navigation to a settings page
      },
    );
  }
}
