import 'package:flutter/material.dart';

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
            Image.asset(_image),
            const Text(
              'Label your Snap',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Take a picture of your food to get nutritional information!',
            ),
            const Text(
              'Enter your food here:',
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a food item',
              ),
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
