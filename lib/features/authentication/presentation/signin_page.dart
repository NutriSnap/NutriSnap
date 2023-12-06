import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide ForgotPasswordView;
import 'package:flutter/material.dart';
import 'package:nutrisnap/common/main_scaffold.dart';
import 'package:nutrisnap/features/profile/presentation/add_profile_view.dart';

import 'decorations.dart';
import 'forgot_password_page.dart';
import 'verify_email_page.dart';

/// Builds the page containing fields to enter a username and password, plus buttons.
class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      actions: [
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            ForgotPasswordPage.routeName,
            arguments: {'email': email},
          );
        }),
        AuthStateChangeAction<SignedIn>((context, state) {
          if (!state.user!.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailPage.routeName);
          } else {
            final db = FirebaseFirestore.instance;
            final docRef = db.collection("profiles").doc(FirebaseAuth.instance.currentUser!.uid);
            docRef.get().then((value) => {
              if (!value.exists) {
                Navigator.pushReplacementNamed(context, AddProfileView.routeName)
              }
              else {
                Navigator.pushReplacementNamed(context, MainScaffold.routeName)
              }
            });
          }
        }),
        AuthStateChangeAction<UserCreated>((context, state) {
          if (!state.credential.user!.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailPage.routeName);
          } else {
            Navigator.pushReplacementNamed(context, MainScaffold.routeName);
          }
        }),
        AuthStateChangeAction<CredentialLinked>((context, state) {
          if (!state.user.emailVerified) {
            Navigator.pushNamed(context, VerifyEmailPage.routeName);
          } else {
            Navigator.pushReplacementNamed(context, MainScaffold.routeName);
          }
        }),
      ],
      styles: const {
        EmailFormStyle(signInButtonVariant: ButtonVariant.filled),
      },
      headerBuilder: headerImage('assets/images/layout/logo1.png'),
      sideBuilder: sideImage('assets/images/layout/logo1.png'),
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            action == AuthAction.signIn
                ? 'Welcome to NutriSnap! Please sign in.'
                : 'Welcome to NutriSnap! Please create an account.',
          ),
        );
      },
      footerBuilder: (context, action) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              action == AuthAction.signIn
                  ? 'By signing in, you agree to our terms and conditions.'
                  : 'By registering, you agree to our terms and conditions.',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      },
    );
  }
}
