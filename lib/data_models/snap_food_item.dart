import 'package:flutter_riverpod/flutter_riverpod.dart';

class SnapFoodItem {
  SnapFoodItem({
    required this.id,
    required this.snapId,
    required this.name,
    required this.processedLevel,
    required this.servings,
  });
  String id;
  String snapId;
  String name;
  String processedLevel; // could be mealId or itemId depending on your schema
  String servings;
}

class SnapFoodItemDB {
  SnapFoodItemDB(this.ref);
  final ProviderRef<SnapFoodItemDB> ref;
  final List<SnapFoodItem> _snapFoodItems = [
    SnapFoodItem(
      id: '1',
      snapId: '1',
      name: 'coffee',
      processedLevel: 'Unprocessed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '2',
      snapId: '2',
      name: 'chicken',
      processedLevel: 'Unprocessed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '3',
      snapId: '2',
      name: 'rice',
      processedLevel: 'Moderately Processed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '4',
      snapId: '2',
      name: 'broccoli',
      processedLevel: 'Unprocessed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '5',
      snapId: '2',
      name: 'tomato',
      processedLevel: 'Unprocessed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '6',
      snapId: '3',
      name: 'pizza',
      processedLevel: 'Highly Processed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '7',
      snapId: '5',
      name: 'spinach',
      processedLevel: 'Unprocessed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '8',
      snapId: '4',
      name: 'pasta',
      processedLevel: 'Moderately Processed',
      servings: '1',
    ),
    SnapFoodItem(
      id: '9',
      snapId: '4',
      name: 'creamy sauce',
      processedLevel: 'Highly Processed',
      servings: '1',
    ),
  ];

  void addSnapFoodItem({
    required String snapId,
    required String name,
    required String processedLevel,
    required String servings,
  }) {
    String id = 'food-${(_snapFoodItems.length + 1).toString().padLeft(3, '0')}';
    SnapFoodItem data = SnapFoodItem(
      id: id,
      snapId: snapId,
      name: name,
      processedLevel: processedLevel,
      servings: servings
    );
    _snapFoodItems.add(data);
  }

  SnapFoodItem getSnapFoodItem(String snapFoodItemId) {
    return _snapFoodItems.firstWhere((snapFoodItem) => snapFoodItem.id == snapFoodItemId);
  }

  String getSnapFoodItemName(String snapFoodItemId) {
    return _snapFoodItems.firstWhere((snapFoodItem) => snapFoodItem.id == snapFoodItemId).name;
  }

  String getSnapFoodItemId(String snapFoodItemName) {
    return _snapFoodItems.firstWhere((snapFoodItem) => snapFoodItem.name == snapFoodItemName).id;
  }

  List<String> getSnapFoodItemIds() {
    return _snapFoodItems.map((snapFoodItem) => snapFoodItem.id).toList();
  }

  List<String> getSnapFoodItemNamesBySnapId(String snapId) {
    return _snapFoodItems
        .where((snapFoodItem) => snapFoodItem.snapId == snapId)
        .map((snapFoodItem) => snapFoodItem.name)
        .toList();
  }

  List<SnapFoodItem> getSnapFoodItemsBySnapId(String snapId) {
    return _snapFoodItems
        .where((snapFoodItem) => snapFoodItem.snapId == snapId) // Filters the meals based on snapId
        .toList();
  }


}

// SnapFoodItemDB snapFoodItemDB = SnapFoodItemDB();