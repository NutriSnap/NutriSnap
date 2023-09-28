import 'package:flutter/material.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  static const String routeName = '/not_found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Not Found'),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text(
          'Not Found Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
