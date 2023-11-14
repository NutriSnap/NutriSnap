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
      path: FirestorePath.meals(),
      builder: (data, documentId) => Meal.fromJson(data!));

  Stream<Meal> watchMeal(String mealId) => _service.watchDocument(
      path: FirestorePath.meal(mealId),
      builder: (data, documentId) => Meal.fromJson(data!));

  Future<List<Meal>> fetchMeals() => _service.fetchCollection(
      path: FirestorePath.meals(),
      builder: (data, documentId) => Meal.fromJson(data!));

  Future<Meal> fetchMeal(String mealId) => _service.fetchDocument(
      path: FirestorePath.meal(mealId),
      builder: (data, documentId) => Meal.fromJson(data!));

  Future<void> setMeal(Meal meal) => _service.setData(
      path: FirestorePath.meal(meal.id), data: meal.toJson());

  Future<void> setMealDelayed(Meal meal) => Future.delayed(
      const Duration(milliseconds: 2000),
          () => _service.setData(
          path: FirestorePath.meal(meal.id), data: meal.toJson()));

  Future<void> setMealError(Meal meal) =>
      Future.delayed(const Duration(milliseconds: 2000), () => throw Error());

  Future<void> deleteMeal(Meal meal) =>
      _service.deleteData(path: FirestorePath.meal(meal.id));
}