import 'snap_food_item.dart';

class SnapFoodItemCollection {
  SnapFoodItemCollection(snapFoodItems): _snapFoodItems = snapFoodItems;

  final List<SnapFoodItem> _snapFoodItems;

  List<SnapFoodItem> get snapFoodItems => _snapFoodItems;

  SnapFoodItem getSnapFoodItem(String id) {
    return _snapFoodItems.firstWhere((snapFoodItem) => snapFoodItem.id == id);
  }

  List<SnapFoodItem> getSnapFoodItemsBySnapId(String snapId) {
    return _snapFoodItems
        .where((snapFoodItem) => snapFoodItem.snapId == snapId) // Filters the snapFoodItems based on snapId
        .toList();
  }
}