import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/user.dart';

// Provides access to the Firestore database storing User documents.
class UserDatabase {
  UserDatabase(this.ref);

  final ProviderRef<UserDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<User>> watchUsers() => _service.watchCollection(
      path: FirestorePath.users(),
      builder: (data, documentId) => User.fromJson(data!));

  Stream<User> watchUser(String userId) => _service.watchDocument(
      path: FirestorePath.user(userId),
      builder: (data, documentId) => User.fromJson(data!));

  Future<List<User>> fetchUsers() => _service.fetchCollection(
      path: FirestorePath.users(),
      builder: (data, documentId) => User.fromJson(data!));

  Future<User> fetchUser(String userId) => _service.fetchDocument(
      path: FirestorePath.user(userId),
      builder: (data, documentId) => User.fromJson(data!));

  Future<void> setUser(User user) =>
      _service.setData(path: FirestorePath.user(user.id), data: user.toJson());
}
