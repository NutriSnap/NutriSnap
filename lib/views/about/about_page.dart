import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/drawer_view.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerView(),
      appBar: AppBar(
        title: const Text('About'),
      ),
    );
  }
}
