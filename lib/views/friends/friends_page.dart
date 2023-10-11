import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/custom_drawer.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);
  static const routeName = '/friends';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
