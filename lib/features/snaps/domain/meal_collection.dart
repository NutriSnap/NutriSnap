import 'meal.dart';
import 'snap_collection.dart';
import 'snap.dart';

class MealCollection {
  MealCollection(meals): _meals = meals;

  final List<Meal> _meals;

  List<Meal> get meals => _meals;

  Meal getMeal(String id) {
    return _meals.firstWhere((meal) => meal.id == id);
  }

  Meal getMealBySnapId(String snapId, SnapCollection snapCollection) {
    Snap data = snapCollection.getSnap(snapId);
    return getMeal(data.mealId);
  }

  List<Meal> getMeals(List<String> ids) {
    return _meals.where((meal) => ids.contains(meal.id)).toList();
  }

  List<Snap> getAssociatedSnaps(String mealId, SnapCollection snapCollection) {
    return snapCollection.getSnapsByMealId(mealId);
  }

  List<String> getMealIdsByOwnerId(String ownerId) {
    return _meals
        .where((meal) => meal.ownerId == ownerId) // Filters the meals based on ownerId
        .map((meal) => meal.id)
        .toList();
  }

}