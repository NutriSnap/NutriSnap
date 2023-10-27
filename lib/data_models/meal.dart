import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/views/snaps/snap_providers.dart';

import 'snap.dart';

class Meal {
  Meal({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.dateTime,
    required this.unprocessedPercentage,
    required this.moderatelyProcessedPercentage,
    required this.highlyProcessedPercentage,
    required this.snapsList,
  });

  String id;
  String ownerId;
  String name; // Breakfast, Lunch, etc.
  DateTime dateTime;
  double unprocessedPercentage;
  double moderatelyProcessedPercentage;
  double highlyProcessedPercentage;
  List<String> snapsList; // list of snap IDs
}

class MealDB {
  MealDB(this.ref);
  final ProviderRef<MealDB> ref;
  final List<Meal> _meals = [
    Meal(
      id: '1',
      ownerId: '1',
      name: 'Breakfast',
      dateTime: DateTime.now(),
      unprocessedPercentage: 50.0,
      moderatelyProcessedPercentage: 25.0,
      highlyProcessedPercentage: 25.0,
      snapsList: ['1', '2', '3'],
    ),
    Meal(
      id: '2',
      ownerId: '2',
      name: 'Lunch',
      dateTime: DateTime.now(),
      unprocessedPercentage: 25.0,
      moderatelyProcessedPercentage: 25.0,
      highlyProcessedPercentage: 50.0,
      snapsList: ['4', '5', '6'],
    ),
    Meal(
      id: '3',
      ownerId: '3',
      name: 'Dinner',
      dateTime: DateTime.now(),
      unprocessedPercentage: 75.0,
      moderatelyProcessedPercentage: 25.0,
      highlyProcessedPercentage: 0.0,
      snapsList: ['7', '8', '9'],
    ),
  ];

  void addMeal({
    required String ownerId,
    required String name,
    required double unprocessedPercentage,
    required double moderatelyProcessedPercentage,
    required double highlyProcessedPercentage,
    required List<String> snapsList,
  }) {
    // String id = 'meal-${(_meals.length + 1).toString().padLeft(3, '0')}';
    String id = 'meal-test';
    DateTime date = DateTime.now();
    Meal data = Meal(
      id: id,
      ownerId: ownerId,
      name: name,
      dateTime: date,
      unprocessedPercentage: unprocessedPercentage,
      moderatelyProcessedPercentage: moderatelyProcessedPercentage,
      highlyProcessedPercentage: highlyProcessedPercentage,
      snapsList: snapsList,
    );
    _meals.add(data);
  }

  Meal getMeal(String mealId) {
    return _meals.firstWhere((meal) => meal.id == mealId);
  }

  List<String> getMealIds() {
    return _meals.map((meal) => meal.id).toList();
  }

  List<String> getAssociatedSnapIds(String mealId) {
    final SnapDB snapDB = ref.watch(snapDBProvider);
    return snapDB.getSnapIdsByMealId(mealId);
  }

  List<String> getMealIdsByOwnerId(String ownerId) {
    return _meals
        .where((meal) => meal.ownerId == ownerId) // Filters the meals based on ownerId
        .map((meal) => meal.id)
        .toList();
  }

}

// MealDB mealDB = MealDB();