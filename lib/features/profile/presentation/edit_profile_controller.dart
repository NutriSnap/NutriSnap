import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/profile_database.dart';
import '../data/profile_provider.dart';
import '../domain/profile.dart';

part 'edit_profile_controller.g.dart';

// The design of this controller is modeled on:
// https://codewithandrea.com/articles/flutter-navigate-without-context-gorouter-riverpod/
// https://codewithandrea.com/articles/async-notifier-mounted-riverpod/
// I am not in love with the "mounted" shenanigans. Sigh.
@riverpod
class EditProfileController extends _$EditProfileController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
    state = const AsyncData(null);
  }

  // Invoked to add a new profile or edit an existing one.
  Future<void> updateProfile({
    required Profile profile,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ProfileDatabase profileDatabase = ref.watch(profileDatabaseProvider);
    final newState =
        await AsyncValue.guard(() => profileDatabase.setProfile(profile));
    if (mounted) {
      state = newState;
    }
    // Weird. Can't use "if (state.hasValue)" below.
    if (!state.hasError) {
      onSuccess();
    }
  }

  Future<void> deleteProfile({
    required Profile profile,
    required VoidCallback onSuccess,
  }) async {
    state = const AsyncLoading();
    ProfileDatabase profileDatabase = ref.watch(profileDatabaseProvider);
    final newState =
        await AsyncValue.guard(() => profileDatabase.deleteProfile(profile));
    if (mounted) {
      state = newState;
    }
    if (!state.hasError) {
      onSuccess();
    }
  }
}
