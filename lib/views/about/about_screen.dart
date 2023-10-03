import 'package:flutter/material.dart';
import '../../common/widgets/bottom_nav_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  static const String routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'About Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
