import 'package:flutter/material.dart';
import 'package:nutrisnap/views/snaps/snaps_page.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  static const String routeName = '/camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Camera'),
      //   backgroundColor: Colors.green,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Camera',
              style: TextStyle(fontSize: 24),
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt),
              onPressed: () {
                // Logic for the camera_icon
                Navigator.of(context).pushNamed(SnapsPage.routeName);
                // Navigator.of(context).pop();
                // Navigator.pushNamed(context, '/snaps');
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/success');
              },
              child: const Text('Upload'),
            )
          ],
        ),
      ),
    );
  }
}

// use source: https://docs.flutter.dev/cookbook/plugins/picture-using-camera