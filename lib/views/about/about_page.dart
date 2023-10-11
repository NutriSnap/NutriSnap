import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/custom_drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      drawer: const CustomDrawer(),
      body: const Center(child: Text('About Page')),
    );
  }
}
