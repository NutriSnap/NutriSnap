import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/custom_drawer.dart';

class CoachPage extends StatelessWidget {
  const CoachPage({Key? key}) : super(key: key);
  static const routeName = '/coach';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coach'),
      ),
      // body: const PlaceholderWidget(Colors.green),
      body: const Center(child: Text('Coach Page')),
      drawer: const CustomDrawer(),
      // bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
