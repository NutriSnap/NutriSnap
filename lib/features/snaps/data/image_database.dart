import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/snap_image.dart';

/// Provides access to the Firestore database storing [Image] documents.
class SnapImageDatabase {
  SnapImageDatabase(this.ref);

  final ProviderRef<SnapImageDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<SnapImage>> watchSnapImages() => _service.watchCollection(
      path: FirestorePath.snapImages(),
      builder: (data, documentId) => SnapImage.fromJson(data!));

  Stream<SnapImage> watchSnapImage(String snapImageId) => _service.watchDocument(
      path: FirestorePath.snapImage(snapImageId),
      builder: (data, documentId) => SnapImage.fromJson(data!));

  Future<List<SnapImage>> fetchSnapImages() => _service.fetchCollection(
      path: FirestorePath.snapImages(),
      builder: (data, documentId) => SnapImage.fromJson(data!));

  Future<SnapImage> fetchSnapImage(String snapImageId) => _service.fetchDocument(
      path: FirestorePath.snapImage(snapImageId),
      builder: (data, documentId) => SnapImage.fromJson(data!));

  Future<void> setSnapImage(SnapImage snapImage) => _service.setData(
      path: FirestorePath.snapImage(snapImage.id), data: snapImage.toJson());

  Future<void> setSnapImageDelayed(SnapImage snapImage) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.snapImage(snapImage.id), data: snapImage.toJson()));

  Future<void> setSnapImageError(SnapImage snapImage) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteSnapImage(SnapImage snapImage) =>
      _service.deleteData(path: FirestorePath.snapImage(snapImage.id));
}