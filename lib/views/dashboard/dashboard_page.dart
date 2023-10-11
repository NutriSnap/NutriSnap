import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/custom_drawer.dart';
import 'package:nutrisnap/views/camera/camera_page.dart';
import 'package:nutrisnap/views/dashboard/dashboard_body.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('NutriSnap'),
      // ),
      drawer: CustomDrawer(),
      floatingActionButton: CustomFloatingActionButton(),
      body: DashboardBody(),
      // bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pushNamed(CameraPage.routeName);
      },
      backgroundColor: Colors.yellow[300],
      child: const Icon(Icons.camera_alt, color: Colors.black, size: 30),
    );
  }
}
