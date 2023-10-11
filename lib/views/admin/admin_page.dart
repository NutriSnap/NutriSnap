import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/custom_drawer.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);
  static const routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
      ),
      // body: const PlaceholderWidget(Colors.green),
      body: const Center(child: Text('Admin Page')),
      drawer: const CustomDrawer(),
      // bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
