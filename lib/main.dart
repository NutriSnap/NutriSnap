import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriSnap',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.lightGreen.shade900),
        useMaterial3: true,
      ),
      // Update to login page
      home: const MySnapsPage(title: 'NutriSnap'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({super.key});

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard),
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.description_outlined),
            label: 'Journal',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.insert_chart),
            icon: Icon(Icons.insert_chart_outlined),
            label: 'Trends',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.emoji_events),
            icon: Icon(Icons.emoji_events_outlined),
            label: 'Challenges',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
        Container(
          color: Colors.yellow,
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
      ][currentPageIndex],
    );
  }
}

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutriSnap'),
      ),
      body: const Center(
        child: Text('Login Page'),
      ),
    );
  }
}

// Sign Up Page
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutriSnap'),
      ),
      body: const Center(
        child: Text('Sign Up Page'),
      ),
    );
  }
}

// Welcome Page (after login)
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutriSnap'),
      ),
      body: const Center(
        child: Text('Welcome Page'),
      ),
    );
  }
}

class MySnapsPage extends StatefulWidget {
  const MySnapsPage({super.key, required this.title});

  final String title;

  @override
  State<MySnapsPage> createState() => _MySnapsPageState();
}

class _MySnapsPageState extends State<MySnapsPage> {
  // image
  static const String _image = 'assets/images/layout/foodplaceholder.png';

  void _snapPicture() {
    setState(() {
      // save the image and display it
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // gradiant background
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF13E3D2),
                Color(0xFF5D74E2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Show the image from the assets folder
            Image.asset(_image),
            const Text(
              'Label your Snap',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Take a picture of your food to get nutritional information!',
            ),
            const Text(
              'Enter your food here:',
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a food item',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _snapPicture,
        tooltip: 'Increment',
        child: const Icon(Icons.camera_alt_rounded,
            color: Colors.black87, size: 40),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: const NavigationDrawer(),
    );
  }
}
