import 'meal.dart';
import 'meal_collection.dart';
import 'snap.dart';
import 'image_model.dart';
import 'image_model_collection.dart';
import 'snap_food_item.dart';
import 'snap_food_item_collection.dart';

class SnapCollection {
  SnapCollection(snaps): _snaps = snaps;

  final List<Snap> _snaps;

  List<Snap> get snaps => _snaps;

  Snap getSnap(String id) {
    return _snaps.firstWhere((snap) => snap.id == id);
  }

  List<Snap> getSnaps(List<String> ids) {
    return _snaps.where((snap) => ids.contains(snap.id)).toList();
  }

  List<Snap> getSnapsByMealId(String mealId) {
    return _snaps
        .where((snap) => snap.mealId == mealId) // Filters the snaps based on mealId
        .toList();
  }

  List<Snap> getSnapsByOwnerId(String ownerId) {
    return _snaps
        .where((snap) => snap.ownerId == ownerId) // Filters the snaps based on ownerId
        .toList();
  }

  List<SnapFoodItem> getAssociatedSnapFoodItems(String snapId, SnapFoodItemCollection snapFoodItemCollection) {
    return snapFoodItemCollection.getSnapFoodItemsBySnapId(snapId);
  }

/*
  UserData getAssociatedUser(String snapId) {
    Snap data = getSnap(snapId);
    final UserDB userDB = ref.watch(userDBProvider);
    return userDB.getUser(data.ownerId);
  }
 */

  Image getAssociatedImage(String snapId, ImageCollection imageCollection) {
    return imageCollection.getImageBySnapId(snapId);
  }

  Meal getAssociatedMeal(String snapId, MealCollection mealCollection) {
    return mealCollection.getMealBySnapId(snapId, this);
  }
}