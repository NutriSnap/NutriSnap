import 'package:flutter/material.dart';

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  static const String routeName = '/challenges';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Challenges Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
