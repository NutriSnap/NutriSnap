import 'package:flutter/material.dart';

import '../../snaps/presentation/snaps_page.dart';

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
            OutlinedButton(
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.of(context).pushNamed(SnapsPage.routeName);
              },
              child: const Text('Continue to Snap'),
            ),
          ],
        ),
      ),
    );
  }
}
