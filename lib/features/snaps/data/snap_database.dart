import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/snap.dart';

/// Provides access to the Firestore database storing [Snap] documents.
class SnapDatabase {
  SnapDatabase(this.ref);

  final ProviderRef<SnapDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Snap>> watchSnaps() => _service.watchCollection(
      path: FirestorePath.Snaps(),
      builder: (data, documentId) => Snap.fromJson(data!));

  Stream<Snap> watchSnap(String SnapId) => _service.watchDocument(
      path: FirestorePath.Snap(SnapId),
      builder: (data, documentId) => Snap.fromJson(data!));

  Future<List<Snap>> fetchSnaps() => _service.fetchCollection(
      path: FirestorePath.Snaps(),
      builder: (data, documentId) => Snap.fromJson(data!));

  Future<Snap> fetchSnap(String SnapId) => _service.fetchDocument(
      path: FirestorePath.Snap(SnapId),
      builder: (data, documentId) => Snap.fromJson(data!));

  Future<void> setSnap(Snap Snap) => _service.setData(
      path: FirestorePath.Snap(Snap.id), data: Snap.toJson());

  Future<void> setSnapDelayed(Snap Snap) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.Snap(Snap.id), data: Snap.toJson()));

  Future<void> setSnapError(Snap Snap) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteSnap(Snap Snap) =>
      _service.deleteData(path: FirestorePath.Snap(Snap.id));
}