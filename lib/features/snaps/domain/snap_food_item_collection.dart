import 'snap_food_item.dart';

class SnapFoodItemCollection {
  SnapFoodItemCollection(snapFoodItems): _snapFoodItems = snapFoodItems;

  final List<SnapFoodItem> _snapFoodItems;

  List<SnapFoodItem> get snapFoodItems => _snapFoodItems;

  List<SnapFoodItem> getSnapFoodItems() {
    return _snapFoodItems
        .toList();
  }
}