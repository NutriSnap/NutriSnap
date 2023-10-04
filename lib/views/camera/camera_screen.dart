import 'package:flutter/material.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  static const String routeName = '/camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Camera',
              style: TextStyle(fontSize: 24),
            ),
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: () {
                // Logic for the camera_icon
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/snaps');
              },
            ),
          ],
        ),
      ),
    );
  }
}

// use source: https://docs.flutter.dev/cookbook/plugins/picture-using-camera