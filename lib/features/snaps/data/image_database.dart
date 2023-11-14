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
      path: FirestorePath.Images(),
      builder: (data, documentId) => Image.fromJson(data!));

  Stream<Image> watchImage(String ImageId) => _service.watchDocument(
      path: FirestorePath.Image(ImageId),
      builder: (data, documentId) => Image.fromJson(data!));

  Future<List<Image>> fetchImages() => _service.fetchCollection(
      path: FirestorePath.Images(),
      builder: (data, documentId) => Image.fromJson(data!));

  Future<Image> fetchImage(String ImageId) => _service.fetchDocument(
      path: FirestorePath.Image(ImageId),
      builder: (data, documentId) => Image.fromJson(data!));

  Future<void> setImage(Image Image) => _service.setData(
      path: FirestorePath.Image(Image.id), data: Image.toJson());

  Future<void> setImageDelayed(Image Image) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.Image(Image.id), data: Image.toJson()));

  Future<void> setImageError(Image Image) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteImage(Image Image) =>
      _service.deleteData(path: FirestorePath.Image(Image.id));
}