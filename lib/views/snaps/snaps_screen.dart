import 'package:flutter/material.dart';
import 'widgets/meal_dropdown_menu.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';

class SnapsScreen extends StatefulWidget {
  const SnapsScreen({super.key});

  @override
  State<SnapsScreen> createState() => _SnapsState();
}

class _SnapsState extends State<SnapsScreen> {
  // image
  static const String _image = 'assets/images/layout/foodplaceholder.png';

  void _snapPicture() {
    setState(() {
      // save the image and display it
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // gradiant background
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF13E3D2),
                Color(0xFF5D74E2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          'Snaps',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Show the image from the assets folder
            Image.asset(
            _image,
            width: 300,
            height: 300,
            ),
            const MealDropdownMenu(),
            const SizedBox(height: 25.0),
            const Text('Food 1'),
            const SizedBox(height: 8.0),
            const Text('Food 2'),
            const SizedBox(height: 8.0),
            const Text('Food 3'),
            const SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.red,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.black,
                    iconSize: 72,
                    onPressed: () {
                      // Navigation action
                    },
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: AppColors.green,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.done),
                    color: Colors.black,
                    iconSize: 72,
                    onPressed: () {
                      // Navigation action
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/snapsEdit');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _snapPicture,
        tooltip: 'Increment',
        child: const Icon(Icons.camera_alt_rounded,
            color: Colors.black87, size: 40),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      // bottomNavigationBar: const NavigationDrawer(),
    );
  }
}
