import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              color: Colors.black,
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              }),
        ],
      ),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              color: Colors.black,
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              }),
        ],
      ),
      body: const Center(
        child: Text('Profile Page'),
      ),
    );
  }
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return RotatedBox(
              quarterTurns: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.black,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              color: Colors.black,
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              }),
        ],
      ),
      body: const Center(
        child: Text('Search Page'),
      ),
    );
  }
}

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  SideMenuState createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(
                    // 'https://www.pngplay.com/wp-content/uploads/13/Green-Background-PNG.png'))),
                    'https://www.pngplay.com/wp-content/uploads/13/Green-Background-PNG-Images-HD.png'))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(48.0, 16.0, 16.0, 8.0),
              child: Text(
                'NutriSnap',
                style: TextStyle(
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                    fontSize: 36),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TabsPage(selectedIndex: 0)),
              )
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TabsPage(selectedIndex: 1)),
              ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Profile'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TabsPage(selectedIndex: 2)),
              ),
            },
          ),
        ],
      ),
    );
  }
}

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem(
      {required this.page, required this.title, required this.icon});

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: const Home(),
          icon: const Icon(Icons.home),
          title: const Text("Home"),
        ),
        TabNavigationItem(
          page: const Search(),
          icon: const Icon(Icons.search),
          title: const Text("Search"),
        ),
        TabNavigationItem(
          page: const Profile(),
          icon: const Icon(Icons.home),
          title: const Text("Home"),
        ),
      ];
}

class TabsPage extends StatefulWidget {
  final int selectedIndex;
  const TabsPage({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  TabsPageState createState() => TabsPageState();
}

class TabsPageState extends State<TabsPage> {
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white),
      home: const TabsPage(selectedIndex: 0),
      debugShowCheckedModeBanner: false,
    );
  }
}
