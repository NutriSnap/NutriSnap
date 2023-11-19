import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/all_data_provider.dart';
import 'package:nutrisnap/features/ns_error.dart';
import 'package:nutrisnap/features/ns_loading.dart';
import 'package:nutrisnap/features/profile/domain/user.dart';
import 'package:nutrisnap/features/profile/presentation/profile_photo_edit.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);

    return asyncAllData.when(
      data: (allData) {
        // Finding the current user based on 'currentUserID'
        final currentUser = allData.users.firstWhere(
          (user) => user.id == allData.currentUserID,
          orElse: () => const User(
            id: '',
            email: '',
            userName: '',
            password: '',
          ), // Default empty user
        );

        // Initializing controllers with user data
        final usernameController =
            TextEditingController(text: currentUser.userName);
        final emailController = TextEditingController(text: currentUser.email);

        return _build(context, usernameController, emailController);
      },
      loading: () => const NSLoading(),
      error: (error, st) => NSError(error.toString(), st.toString()),
    );
  }

  Widget _build(BuildContext context, TextEditingController usernameController,
      TextEditingController emailController) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 120),
              child: ProfilePhotoEdit(),
            ),
            _buildProfileTextField(usernameController, 'Username'),
            _buildProfileTextField(emailController, 'Email'),
            _buildUpdateButton(context),
          ],
        ),
      ),
    );
  }

  Padding _buildProfileTextField(TextEditingController controller, String label,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  TextButton _buildUpdateButton(BuildContext context) {
    return TextButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onPressed: () {
        // Update profile logic
      },
      child: Text(
        'Update Profile',
        style: TextStyle(color: Theme.of(context).colorScheme.surface),
      ),
    );
  }
}



// class ProfilePage extends ConsumerWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   static const routeName = '/profile';

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
//     return asyncAllData.when(
//       data: (allData) {
//         // Initialize controllers with user data
//         final usernameController =
//             TextEditingController(text: allData.currentUserID);
//         final emailController =
//             TextEditingController(text: allData.currentUserID.email);
//         final phoneController =
//             TextEditingController(text: allData.currentUserID.phone);

//         return _build(
//             context, usernameController, emailController, phoneController);
//       },
//       loading: () => const NSLoading(),
//       error: (error, st) => NSError(error.toString(), st.toString()),
//     );
//   }

//   Widget _build(
//       BuildContext context,
//       TextEditingController usernameController,
//       TextEditingController emailController,
//       TextEditingController phoneController) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 120),
//               child: ProfilePhotoEdit(),
//             ),
//             _buildProfileTextField(usernameController, 'Username'),
//             _buildProfileTextField(emailController, 'Email'),
//             // _buildProfileTextField(passwordController, 'Password', isPassword: true),
//             _buildProfileTextField(phoneController, 'Phone Number'),
//             _buildUpdateButton(context),
//           ],
//         ),
//       ),
//     );
//   }

//   Padding _buildProfileTextField(TextEditingController controller, String label,
//       {bool isPassword = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           border: const OutlineInputBorder(),
//           label: Text(
//             label,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   TextButton _buildUpdateButton(BuildContext context) {
//     return TextButton(
//       style: OutlinedButton.styleFrom(
//         backgroundColor: Theme.of(context).primaryColor,
//       ),
//       onPressed: () {
//         // Update profile logic
//       },
//       child: Text(
//         'Update Profile',
//         style: TextStyle(color: Theme.of(context).colorScheme.surface),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:nutrisnap/features/profile/presentation/profile_photo_edit.dart';

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

// /// ProfilePage is a StatelessWidge (soon to be StatefulWidget) that displays the user's profile.
// /// 1. The user's profile picture is displayed at the top of the page.
// /// 2. The user's username, email, password, and phone number are displayed in TextFields.
// /// 3. The user can update their profile by pressing the "Update Profile" button.

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});

//   static const routeName = '/profile';

//   @override
//   Widget build(BuildContext context) {
//     // User user = FirebaseAuth.instance.currentUser!;
//     // print('User: $user');
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 120),
//               child: ProfilePhotoEdit(),
//             ),
//             buildProfileTextField(usernameController, 'Username'),
//             buildProfileTextField(emailController, 'Email'),
//             buildProfileTextField(passwordController, 'Password',
//                 isPassword: true),
//             buildProfileTextField(phoneController, 'Phone Number'),
//             TextButton(
//               style: OutlinedButton.styleFrom(
//                 backgroundColor: Theme.of(context).primaryColor,
//               ),
//               onPressed: () {
//                 // Navigation action
//               },
//               child: Text(
//                 'Update Profile',
//                 style: TextStyle(color: Theme.of(context).colorScheme.surface),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Padding buildProfileTextField(TextEditingController controller, String label,
//       {bool isPassword = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
//       child: TextField(
//         controller: controller,
//         obscureText: isPassword,
//         decoration: InputDecoration(
//           border: const OutlineInputBorder(),
//           label: Text(
//             label,
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
