import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repositories/firestore/firestore_path.dart';
import '../../../repositories/firestore/firestore_service.dart';
import '../domain/meal.dart';

/// Provides access to the Firestore database storing [Meal] documents.
class MealDatabase {
  MealDatabase(this.ref);

  final ProviderRef<MealDatabase> ref;

  final _service = FirestoreService.instance;

  Stream<List<Meal>> watchMeals() => _service.watchCollection(
      path: FirestorePath.Meals(),
      builder: (data, documentId) => Meal.fromJson(data!));

  Stream<Meal> watchMeal(String MealId) => _service.watchDocument(
      path: FirestorePath.Meal(MealId),
      builder: (data, documentId) => Meal.fromJson(data!));

  Future<List<Meal>> fetchMeals() => _service.fetchCollection(
      path: FirestorePath.Meals(),
      builder: (data, documentId) => Meal.fromJson(data!));

  Future<Meal> fetchMeal(String MealId) => _service.fetchDocument(
      path: FirestorePath.Meal(MealId),
      builder: (data, documentId) => Meal.fromJson(data!));

  Future<void> setMeal(Meal Meal) => _service.setData(
      path: FirestorePath.Meal(Meal.id), data: Meal.toJson());

  Future<void> setMealDelayed(Meal Meal) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.Meal(Meal.id), data: Meal.toJson()));

  Future<void> setMealError(Meal Meal) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteMeal(Meal Meal) =>
      _service.deleteData(path: FirestorePath.Meal(Meal.id));
}