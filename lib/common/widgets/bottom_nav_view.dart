import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final Function(int) onTabSelected;
  final int initialIndex;

  const CustomBottomNavigationBar({
    super.key,
    required this.onTabSelected,
    this.initialIndex = 0,
  });

  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onTabSelected(index);
      },
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
    );
  }
}
