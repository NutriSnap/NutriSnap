import 'package:flutter/material.dart';

/// This is the Welcome Screen.
/// It appears once the user has logged in.
/// It shows the current user's name and profile picture
/// along with a welcome message, their current streak,
/// and a button to take a picture of their meal.

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutriSnap'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to NutriSnap!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              'Take a picture of your meal to get started.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/camera');
              },
              child: const Text('Take a Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
