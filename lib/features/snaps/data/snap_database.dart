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
      path: FirestorePath.snaps(),
      builder: (data, documentId) => Snap.fromJson(data!));

  Stream<Snap> watchSnap(String snapId) => _service.watchDocument(
      path: FirestorePath.snap(snapId),
      builder: (data, documentId) => Snap.fromJson(data!));

  Future<List<Snap>> fetchSnaps() => _service.fetchCollection(
      path: FirestorePath.snaps(),
      builder: (data, documentId) => Snap.fromJson(data!));

  Future<Snap> fetchSnap(String snapId) => _service.fetchDocument(
      path: FirestorePath.snap(snapId),
      builder: (data, documentId) => Snap.fromJson(data!));

  Future<void> setSnap(Snap snap) => _service.setData(
      path: FirestorePath.snap(snap.id), data: snap.toJson());

  Future<void> setSnapDelayed(Snap snap) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.snap(snap.id), data: snap.toJson()));

  Future<void> setSnapError(Snap snap) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteSnap(Snap snap) =>
      _service.deleteData(path: FirestorePath.snap(snap.id));
}