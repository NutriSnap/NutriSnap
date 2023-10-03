import 'package:flutter/material.dart';

class TrendsScreen extends StatelessWidget {
  const TrendsScreen({Key? key}) : super(key: key);

  static const String routeName = '/trends';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Trends Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
