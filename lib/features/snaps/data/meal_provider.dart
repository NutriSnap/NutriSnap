//import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/snaps/domain/meal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutrisnap/features/snaps/data/meal_database.dart';
part 'meal_provider.g.dart';

@riverpod
MealDatabase mealDatabase(MealDatabaseRef ref) {
  return MealDatabase(ref);
}

@riverpod
Stream<List<Meal>> meals(MealsRef ref) {
  final database = ref.watch(mealDatabaseProvider);
  return database.watchMeals();
}

/*
final mealDBProvider = Provider<MealDB>((ref) {
  return MealDB(ref);
});
 */