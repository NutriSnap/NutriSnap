import 'package:flutter/material.dart';
import 'package:nutrisnap/views/camera/success_page.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  static const String routeName = '/success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Upload Successful!',
              style: TextStyle(fontSize: 24),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/snaps');
              },
              child: const Text('Return'),
            )
          ],
        ),
      ),
    );
  }
}