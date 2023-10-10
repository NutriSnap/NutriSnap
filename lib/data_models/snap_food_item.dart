
class SnapFoodItem {
  SnapFoodItem({
    required this.id,
    required this.name,
    required this.processedLevel,
    required this.servings,
  });
  String id;
  String name;
  String processedLevel; // could be mealId or itemId depending on your schema
  String servings;
}

class SnapFoodItemDB {
  final List<SnapFoodItem> _snapFoodItems = [
    SnapFoodItem(
      id: '1',
      name: 'Apple',
      processedLevel: 'Unprocessed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '2',
      name: 'Banana',
      processedLevel: 'Unprocessed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '3',
      name: 'Orange',
      processedLevel: 'Unprocessed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '4',
      name: 'Bread',
      processedLevel: 'Moderately Processed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '5',
      name: 'Pasta',
      processedLevel: 'Moderately Processed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '6',
      name: 'Rice',
      processedLevel: 'Moderately Processed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '7',
      name: 'Pizza',
      processedLevel: 'Highly Processed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '8',
      name: 'Burger',
      processedLevel: 'Highly Processed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '9',
      name: 'Fries',
      processedLevel: 'Highly Processed',
      servings: '1',
    ),
  ];

  SnapFoodItem getSnapFoodItem(String snapFoodItemId) {
    return _snapFoodItems.firstWhere((snapFoodItem) => snapFoodItem.id == snapFoodItemId);
  }

  String getSnapFoodItemId(String snapFoodItemName) {
    return _snapFoodItems.firstWhere((snapFoodItem) => snapFoodItem.name == snapFoodItemName).id;
  }

  List<String> getSnapFoodItemIds() {
    return _snapFoodItems.map((snapFoodItem) => snapFoodItem.id).toList();
  }

}

SnapFoodItemDB snapFoodItemDB = SnapFoodItemDB();