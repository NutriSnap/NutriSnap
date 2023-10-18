import 'package:flutter/material.dart';
import 'package:nutrisnap/utils/image_upload_page.dart';
import 'package:nutrisnap/views/snaps/snaps_page.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({Key? key}) : super(key: key);

  static const String routeName = '/camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Snap'),
        backgroundColor: Colors.green,
      ),
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
            OutlinedButton(
              onPressed: () {
                // Navigate to the /utils/image_upload_page.dart
                Navigator.of(context).pushNamed(ImageUploadPage.routeName);
                // Then navigate to the /success page after the image is uploaded
                // TODO: need to add a state that tells whether the picture is a success or not
                // Navigator.pushNamed(context, '/success');
              },
              child: const Text('Crop Your Snap'),
            ),
          ],
        ),
      ),
    );
  }
}

// use source: https://docs.flutter.dev/cookbook/plugins/picture-using-camera