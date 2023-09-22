import 'package:flutter/material.dart';
import 'package:nutrisnap/views/dashboard/dashboard_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to NutriSnap!'),
      ),
      bottomNavigationBar: NavigationExample(),
    );
  }
}

// class NavigationBarApp extends StatelessWidget {
//   const NavigationBarApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(home: NavigationExample());
//   }
// }

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
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
            selectedIcon: Icon(Icons.home),
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
          child: const DashboardView(),
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
