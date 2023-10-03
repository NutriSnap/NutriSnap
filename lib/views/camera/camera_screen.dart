import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text(
          'Camera',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

// use source: https://docs.flutter.dev/cookbook/plugins/picture-using-camera