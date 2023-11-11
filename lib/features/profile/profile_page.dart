import 'package:flutter/material.dart';

class FakeUser {
  final String username;
  final String email;
  final String password;
  final String phone;

  FakeUser({
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
  });
}

final TextEditingController usernameController =
    TextEditingController(text: 'User123');
final TextEditingController emailController =
    TextEditingController(text: 'user@example.com');
final TextEditingController passwordController =
    TextEditingController(text: 'password123');
final TextEditingController phoneController =
    TextEditingController(text: '123-456-7890');

FakeUser fakeUser = FakeUser(
  username: usernameController.text,
  email: emailController.text,
  password: passwordController.text,
  phone: phoneController.text,
);

/// ProfilePage is a StatelessWidge (soon to be StatefulWidget) that displays the user's profile.
/// 1. The user's profile picture is displayed at the top of the page.
/// 2. The user's username, email, password, and phone number are displayed in TextFields.
/// 3. The user can update their profile by pressing the "Update Profile" button.

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    // User user = FirebaseAuth.instance.currentUser!;
    // print('User: $user');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 120),
              child: CircleAvatar(
                radius: 100.0,
                backgroundImage:
                    NetworkImage('https://robohash.org/sample.png'),
              ),
            ),
            buildProfileTextField(usernameController, 'Username'),
            buildProfileTextField(emailController, 'Email'),
            buildProfileTextField(passwordController, 'Password',
                isPassword: true),
            buildProfileTextField(phoneController, 'Phone Number'),
            OutlinedButton(
              onPressed: () {
                // Navigation action
              },
              child: const Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildProfileTextField(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}