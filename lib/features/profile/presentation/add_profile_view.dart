import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nutrisnap/common/main_scaffold.dart';

import 'package:nutrisnap/features/profile/domain/profile.dart';
import '../../global_snackbar.dart';
import '../../ns_error.dart';
import '../../ns_loading.dart';
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

    void onSubmit() async {
      bool isValid = _formKey.currentState?.saveAndValidate() ?? false;
      if (!isValid) return;
      // Since validation passed, we can safely access the values.
      String firstName = _firstNameFieldKey.currentState?.value;
      String lastName = _lastNameFieldKey.currentState?.value;
      String initials = _initialsFieldKey.currentState?.value;
      String imageFileName = _photoFieldKey.currentState?.value;
      String imagePath = 'assets/images/$imageFileName';
      Profile profile = Profile(
          id: FirebaseAuth.instance.currentUser!.uid,
          firstName: firstName,
          lastName: lastName,
          imagePath: imagePath,
          initials: initials,
      );
      ref.read(editProfileControllerProvider.notifier).updateProfile(
        profile: profile,
        onSuccess: () {
          Navigator.pushReplacementNamed(context, MainScaffold.routeName);
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
          title: const Text('Create My Profile'),
        ),
        body: asyncUpdate.when(
            data: (_) => addProfileForm(),
            error: (error, stacktrace) => NSError(error.toString(), stacktrace.toString()),
            loading: () => const NSLoading()
        )
    );
  }
}