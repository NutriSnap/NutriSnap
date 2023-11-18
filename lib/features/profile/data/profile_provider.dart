import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/profile.dart';
import 'profile_database.dart';

part 'profile_provider.g.dart';

@riverpod
ProfileDatabase profileDatabase(ProfileDatabaseRef ref) {
  return ProfileDatabase(ref);
}

@riverpod
Stream<List<Profile>> profiles(ProfilesRef ref) {
  final database = ref.watch(profileDatabaseProvider);
  return database.watchProfiles();
}
