// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nutrisnap/core/constants/pallete.dart';
import 'package:nutrisnap/common/widgets/custom_text_field.dart';
import 'package:nutrisnap/views/auth/login/widgets/square_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  // final Function()? onTap;
  const LoginPage({
    super.key,
    // required this.onTap,
  });

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _showButtonPressDialog(BuildContext context, String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$provider Button Pressed!'),
        backgroundColor: Colors.black26,
        duration: const Duration(milliseconds: 400),
      ),
    );
  }

  void signIn() async {
    // Use a local context variable for the dialog.
    late BuildContext dialogContext = context;

    showDialog(
        context: context,
        builder: (context) {
          dialogContext = context;
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pop(dialogContext); // Use dialogContext here
    } on FirebaseAuthException catch (e) {
      Navigator.pop(dialogContext); // And here
      showErrorMessage(e.message!);
    }
  }

  // error handling
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showGithub() {
    _showButtonPressDialog(context, 'Github');
  }

  void showGoogle() {
    _showButtonPressDialog(context, 'Google');
  }

  void showApple() {
    _showButtonPressDialog(context, 'Apple');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('loginScreen'),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'NutriSnap',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Pallete.avacodoSeedLightBrown,
                  ),
                ),
                Image.asset(
                  'assets/images/layout/logo1.png',
                  width: 200,
                ),
                // Icon(Icons.lock_outlined, size: 100),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Email',
                  textEditingController: _emailController,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Password',
                  textEditingController: _passwordController,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/forgot_password');
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                /**
                 * Sign in button
                 */
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: () {
                      signIn();
                    },
                    child: Container(
                      width: 325,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Pallete.avocadoLightGreen,
                            Pallete.avocadoYellow,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Pallete.avacodoSeedBrown,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // EmailSignOnButton(
                //   emailController: _emailController,
                //   passwordController: _passwordController,
                //   signUserIn: signUserIn,
                // ),
                const SizedBox(height: 10),
                /**
                 * Not a member yet? Register now
                 */
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member yet?',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                /**
                 * Or continue with
                 */
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 0.5,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                /**
                 * Social Media Buttons
                 */
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareButton(iconPath: 'assets/svgs/github-icon.svg'),
                    SizedBox(width: 30),
                    SquareButton(iconPath: 'assets/svgs/google-icon.svg'),
                    // SizedBox(width: 30),
                    // SquareButton(iconPath: 'assets/svgs/apple-icon.svg'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
