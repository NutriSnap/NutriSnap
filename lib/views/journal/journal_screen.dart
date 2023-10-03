import 'package:flutter/material.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({Key? key}) : super(key: key);

  static const String routeName = '/journal';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Journal Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
