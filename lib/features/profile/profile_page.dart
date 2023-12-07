import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ns_error.dart';
import '../ns_loading.dart';
import '../all_data_provider.dart';
import 'domain/profile.dart';
import 'domain/profile_collection.dart';
import 'presentation/add_profile_view.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(context: context, profiles: allData.profiles),
        error: (error, stacktrace) =>
            NSError(error.toString(), stacktrace.toString()),
        loading: () => const NSLoading());
  }

  Widget _build(
      {required BuildContext context, required List<Profile> profiles}) {
    String profileID = FirebaseAuth.instance.currentUser!.uid;
    ProfileCollection profileCollection = ProfileCollection(profiles);
    Profile profile = profileCollection.getProfile(profileID);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 100,
                backgroundImage:
                    profile.imagePath != null && profile.imagePath!.isNotEmpty
                        ? AssetImage(profile.imagePath!)
                            as ImageProvider //FileImage(_image!),
                        : const NetworkImage(
                            'https://robohash.org/sample.png?size=300x300')),
            const SizedBox(height: 16),
            Text('${profile.firstName} ${profile.lastName}'),
            const SizedBox(height: 16),
            TextButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AddProfileView.routeName);
              },
              child: Text(
                'Edit My Profile',
                style: TextStyle(color: Theme.of(context).colorScheme.surface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
