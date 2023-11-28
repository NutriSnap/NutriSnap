import 'package:firebase_auth/firebase_auth.dart';
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

@riverpod
String currentUserID(CurrentUserIDRef ref) {
  final FirebaseAuth instance = ref.watch(firebaseAuthProvider);
  return instance.currentUser!.email!;
}

@riverpod
Future<User> currentUser(CurrentUserRef ref) async {
  final String currentUserId = ref.watch(currentUserIDProvider);
  final database = ref.watch(profileDatabaseProvider);
  return await database.fetchUser(currentUserId);
}
