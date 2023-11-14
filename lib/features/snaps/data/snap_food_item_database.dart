import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/snap_food_item.dart';

/// Provides access to the Firestore database storing [SnapFoodItem] documents.
class SnapFoodItemDatabase {
  SnapFoodItemDatabase(this.ref);

  final ProviderRef<SnapFoodItemDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<SnapFoodItem>> watchSnapFoodItems() => _service.watchCollection(
      path: FirestorePath.SnapFoodItems(),
      builder: (data, documentId) => SnapFoodItem.fromJson(data!));

  Stream<SnapFoodItem> watchSnapFoodItem(String SnapFoodItemId) => _service.watchDocument(
      path: FirestorePath.SnapFoodItem(SnapFoodItemId),
      builder: (data, documentId) => SnapFoodItem.fromJson(data!));

  Future<List<SnapFoodItem>> fetchSnapFoodItems() => _service.fetchCollection(
      path: FirestorePath.SnapFoodItems(),
      builder: (data, documentId) => SnapFoodItem.fromJson(data!));

  Future<SnapFoodItem> fetchSnapFoodItem(String SnapFoodItemId) => _service.fetchDocument(
      path: FirestorePath.SnapFoodItem(SnapFoodItemId),
      builder: (data, documentId) => SnapFoodItem.fromJson(data!));

  Future<void> setSnapFoodItem(SnapFoodItem SnapFoodItem) => _service.setData(
      path: FirestorePath.SnapFoodItem(SnapFoodItem.id), data: SnapFoodItem.toJson());

  Future<void> setSnapFoodItemDelayed(SnapFoodItem SnapFoodItem) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.SnapFoodItem(SnapFoodItem.id), data: SnapFoodItem.toJson()));

  Future<void> setSnapFoodItemError(SnapFoodItem SnapFoodItem) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteSnapFoodItem(SnapFoodItem SnapFoodItem) =>
      _service.deleteData(path: FirestorePath.SnapFoodItem(SnapFoodItem.id));
}