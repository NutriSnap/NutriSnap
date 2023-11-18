import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/profile.dart';

/// Provides access to the Firestore database storing [Profile] documents.
class ProfileDatabase {
  ProfileDatabase(this.ref);

  final ProviderRef<ProfileDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Profile>> watchProfiles() => _service.watchCollection(
      path: FirestorePath.profiles(),
      builder: (data, documentId) => Profile.fromJson(data!));

  Stream<Profile> watchProfile(String profileId) => _service.watchDocument(
      path: FirestorePath.profile(profileId),
      builder: (data, documentId) => Profile.fromJson(data!));

  Future<List<Profile>> fetchProfiles() => _service.fetchCollection(
      path: FirestorePath.profiles(),
      builder: (data, documentId) => Profile.fromJson(data!));

  Future<Profile> fetchProfile(String profileId) => _service.fetchDocument(
      path: FirestorePath.profile(profileId),
      builder: (data, documentId) => Profile.fromJson(data!));

  Future<void> setProfile(Profile profile) => _service.setData(
      path: FirestorePath.profile(profile.id), data: profile.toJson());

  Future<void> setProfileDelayed(Profile profile) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.profile(profile.id), data: profile.toJson()));

  Future<void> setProfileError(Profile profile) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteProfile(Profile profile) =>
      _service.deleteData(path: FirestorePath.profile(profile.id));
}