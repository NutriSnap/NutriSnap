import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/profile/domain/profile.dart';
import 'package:nutrisnap/features/snaps/domain/snap.dart';

import '../../all_data_provider.dart';
import '../../global_snackbar.dart';
import '../../ns_error.dart';
import '../../ns_loading.dart';
import '../domain/user.dart';
import '../domain/user_collection.dart';
import '../profile_page.dart';
import 'edit_profile_controller.dart';
import 'form-fields/first_name_field.dart';
import 'form-fields/initials_field.dart';
import 'form-fields/last_name_field.dart';
import 'form-fields/photo_field.dart';
import 'form-fields/reset_button.dart';
import 'form-fields/submit_button.dart';

class AddProfileView extends ConsumerWidget {
  AddProfileView({Key? key}) : super(key: key);

  static const routeName = '/addProfileView';
  final _formKey = GlobalKey<FormBuilderState>();
  final _firstNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _lastNameFieldKey = GlobalKey<FormBuilderFieldState>();
  final _photoFieldKey = GlobalKey<FormBuilderFieldState>();
  final _initialsFieldKey = GlobalKey<FormBuilderFieldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            currentUserID: allData.currentUserID,
            snaps: allData.snaps,
            users: allData.users,
            date: allData.date,
            profiles: allData.profiles,
            ref: ref
        ),
        error: (error, stacktrace) => NSError(error.toString(), stacktrace.toString()),
        loading: () => const NSLoading()
    );
  }

  Widget _build({
    required BuildContext context,
    required String currentUserID,
    required List<Snap> snaps,
    required List<User> users,
    required List<Profile> profiles,
    required DateTime date,
    required WidgetRef ref
  }) {
    void onSubmit() {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      // Since validation passed, we can safely access the values.
      String firstName = _firstNameFieldKey.currentState?.value;
      String lastName = _lastNameFieldKey.currentState?.value;
      String imageFileName = _photoFieldKey.currentState?.value;
      String initials = _initialsFieldKey.currentState?.value;
      //int numprofiles = UserCollection.size();
      //String id = 'profile-${(numprofiles + 1).toString().padLeft(3, '0')}';
      String id = 'profile-001';
      String imagePath = 'assets/images/$imageFileName';
      Profile profile = Profile(
          id: id,
          ownerID: currentUserID,
          firstName: firstName,
          lastName: lastName,
          imagePath: imagePath,
          initials: initials,
      );
      ref.read(editProfileControllerProvider.notifier).updateProfile(
        profile: profile,
        onSuccess: () {
          Navigator.pushReplacementNamed(context, ProfilePage.routeName);
          GlobalSnackBar.show('Profile "$firstName" added.');
        },
      );
    }

    void onReset() {
      _formKey.currentState?.reset();
    }

    Widget addProfileForm() => ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      children: [
        Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FirstNameField(fieldKey: _firstNameFieldKey),
                  LastNameField(fieldKey: _lastNameFieldKey),
                  PhotoField(fieldKey: _photoFieldKey),
                  InitialsField(fieldKey: _initialsFieldKey),
                ],
              ),
            ),
            Row(
              children: [
                SubmitButton(onSubmit: onSubmit),
                ResetButton(onReset: onReset),
              ],
            ),
          ],
        ),
      ],
    );

    AsyncValue asyncUpdate = ref.watch(editProfileControllerProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Profile'),
        ),
        body: asyncUpdate.when(
            data: (_) => addProfileForm(),
            error: (error, stacktrace) => NSError(error.toString(), stacktrace.toString()),
            loading: () => const NSLoading()
        )
    );
  }
}