import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../data_models/user_db.dart';

// class FakeUser {
//   final String username;
//   final String email;
//   final String password;
//   final String phone;

//   FakeUser({
//     required this.username,
//     required this.email,
//     required this.password,
//     required this.phone,
//   });
// }

// final TextEditingController usernameController =
//     TextEditingController(text: 'User123');
// final TextEditingController emailController =
//     TextEditingController(text: 'user@example.com');
// final TextEditingController passwordController =
//     TextEditingController(text: 'password123');
// final TextEditingController phoneController =
//     TextEditingController(text: '123-456-7890');

// FakeUser fakeUser = FakeUser(
//   username: usernameController.text,
//   email: emailController.text,
//   password: passwordController.text,
//   phone: phoneController.text,
// );

/// ProfilePage is a StatelessWidge (soon to be StatefulWidget) that displays the user's profile.
/// 1. The user's profile picture is displayed at the top of the page.
/// 2. The user's username, email, password, and phone number are displayed in TextFields.
/// 3. The user can update their profile by pressing the "Update Profile" button.

class ProfilePage extends ConsumerWidget {
  ProfilePage({Key? key}) : super(key: key);

  static const routeName = '/profile';

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserDB userDB = ref.watch(userDBProvider);
    final String currentUserID = ref.watch(currentUserIDProvider);

    String? validateIsUniqueUsername(String? username) {
      if (username == null) return 'Username cannot be empty';

      for (var user in userDB.getUsers()) {
        if (user.username == username) {
          return 'Username already exists';
        }

        return null;
      }
    }

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
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'username',
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.maxLength(20),
                      FormBuilderValidators.minLength(3),
                      validateIsUniqueUsername,
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'currentPassword',
                    decoration:
                        const InputDecoration(labelText: 'Current Password'),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      (val) => (val != 'hardcodedFakePassword')
                          ? 'Invalid current password'
                          : null,
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'newPassword',
                    decoration:
                        const InputDecoration(labelText: 'New Password'),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8),
                    ]),
                  ),
                  FormBuilderTextField(
                    name: 'phone',
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                      FormBuilderValidators.minLength(10),
                      FormBuilderValidators.maxLength(10),
                    ]),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        // Assuming `updateUser` function takes a `UserData` object.
                        UserData oldUser = userDB.getUser(
                            currentUserID)!; // assuming you're sure the user exists

                        UserData updatedUser = oldUser.copyWith(
                          username: _formKey.currentState!.value['username'],
                          email: _formKey.currentState!.value['email'],
                          phone: _formKey.currentState!.value['phone'],
                          // ... Add other fields here ...
                        );
                        userDB.updateUser(updatedUser);
                      }
                    },
                    child: const Text('Update Profile'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
