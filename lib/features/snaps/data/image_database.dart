import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/image_model.dart';

/// Provides access to the Firestore database storing [Image] documents.
class ImageDatabase {
  ImageDatabase(this.ref);

  final ProviderRef<ImageDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Image>> watchImages() => _service.watchCollection(
      path: FirestorePath.images(),
      builder: (data, documentId) => Image.fromJson(data!));

  Stream<Image> watchImage(String imageId) => _service.watchDocument(
      path: FirestorePath.image(imageId),
      builder: (data, documentId) => Image.fromJson(data!));

  Future<List<Image>> fetchImages() => _service.fetchCollection(
      path: FirestorePath.images(),
      builder: (data, documentId) => Image.fromJson(data!));

  Future<Image> fetchImage(String imageId) => _service.fetchDocument(
      path: FirestorePath.image(imageId),
      builder: (data, documentId) => Image.fromJson(data!));

  Future<void> setImage(Image image) => _service.setData(
      path: FirestorePath.image(image.id), data: image.toJson());

  Future<void> setImageDelayed(Image image) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.image(image.id), data: image.toJson()));

  Future<void> setImageError(Image image) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteImage(Image image) =>
      _service.deleteData(path: FirestorePath.image(image.id));
}