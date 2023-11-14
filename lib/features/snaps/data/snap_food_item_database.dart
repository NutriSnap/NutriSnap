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
      path: FirestorePath.snapFoodItems(),
      builder: (data, documentId) => SnapFoodItem.fromJson(data!));

  Stream<SnapFoodItem> watchSnapFoodItem(String snapFoodItemId) => _service.watchDocument(
      path: FirestorePath.snapFoodItem(snapFoodItemId),
      builder: (data, documentId) => SnapFoodItem.fromJson(data!));

  Future<List<SnapFoodItem>> fetchSnapFoodItems() => _service.fetchCollection(
      path: FirestorePath.snapFoodItems(),
      builder: (data, documentId) => SnapFoodItem.fromJson(data!));

  Future<SnapFoodItem> fetchSnapFoodItem(String snapFoodItemId) => _service.fetchDocument(
      path: FirestorePath.snapFoodItem(snapFoodItemId),
      builder: (data, documentId) => SnapFoodItem.fromJson(data!));

  Future<void> setSnapFoodItem(SnapFoodItem snapFoodItem) => _service.setData(
      path: FirestorePath.snapFoodItem(snapFoodItem.id), data: snapFoodItem.toJson());

  Future<void> setSnapFoodItemDelayed(SnapFoodItem snapFoodItem) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.snapFoodItem(snapFoodItem.id), data: snapFoodItem.toJson()));

  Future<void> setSnapFoodItemError(SnapFoodItem snapFoodItem) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteSnapFoodItem(SnapFoodItem snapFoodItem) =>
      _service.deleteData(path: FirestorePath.snapFoodItem(snapFoodItem.id));
}