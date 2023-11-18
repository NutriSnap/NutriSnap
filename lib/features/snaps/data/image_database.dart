import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/snap_image.dart';

/// Provides access to the Firestore database storing [Image] documents.
class ImageDatabase {
  ImageDatabase(this.ref);

  final ProviderRef<ImageDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<SnapImage>> watchImages() => _service.watchCollection(
      path: FirestorePath.snapImages(),
      builder: (data, documentId) => SnapImage.fromJson(data!));

  Stream<SnapImage> watchImage(String snapImageId) => _service.watchDocument(
      path: FirestorePath.snapImage(snapImageId),
      builder: (data, documentId) => SnapImage.fromJson(data!));

  Future<List<SnapImage>> fetchImages() => _service.fetchCollection(
      path: FirestorePath.snapImages(),
      builder: (data, documentId) => SnapImage.fromJson(data!));

  Future<SnapImage> fetchImage(String snapImageId) => _service.fetchDocument(
      path: FirestorePath.snapImage(snapImageId),
      builder: (data, documentId) => SnapImage.fromJson(data!));

  Future<void> setImage(SnapImage image) => _service.setData(
      path: FirestorePath.snapImage(image.id), data: image.toJson());

  Future<void> setImageDelayed(SnapImage image) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.snapImage(image.id), data: image.toJson()));

  Future<void> setImageError(SnapImage image) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteImage(SnapImage image) =>
      _service.deleteData(path: FirestorePath.snapImage(image.id));
}