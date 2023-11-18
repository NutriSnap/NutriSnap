import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'snap_food_item.freezed.dart';
part 'snap_food_item.g.dart';

@freezed
class SnapFoodItem with _$SnapFoodItem {
  const factory SnapFoodItem({
    required String name,
    required String processedLevel,
    required int servings,
    required int calories,
  }) = _SnapFoodItem;

  factory SnapFoodItem.fromJson(Map<String, dynamic> json) => _$SnapFoodItemFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<SnapFoodItem>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/foods.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => SnapFoodItem.fromJson(jsonData)).toList();
  }
}

/*
class SnapFoodItem {
  SnapFoodItem({
    required this.id,
    required this.snapId,
    required this.name,
    required this.processedLevel,
    required this.servings,
    required this.calories,
  });
  String id;
  String snapId;
  String name;
  String processedLevel; // could be mealId or itemId depending on your schema
  String servings;
  int calories;
}

class SnapFoodItemDB {
  SnapFoodItemDB(this.ref);
  final ProviderRef<SnapFoodItemDB> ref;
  final List<SnapFoodItem> _snapFoodItems = [
    SnapFoodItem(
      id: 'food-001',
      snapId: 'snap-001',
      name: 'coffee',
      processedLevel: 'Unprocessed',
      servings: '1',
      calories: 10,
    ),
    SnapFoodItem(
      id: 'food-002',
      snapId: 'snap-002',
      name: 'chicken',
      processedLevel: 'Unprocessed',
      servings: '1',
      calories: 100,
    ),
    SnapFoodItem(
      id: 'food-003',
      snapId: 'snap-002',
      name: 'rice',
      processedLevel: 'Moderately Processed',
      servings: '1',
      calories: 200,
    ),
    SnapFoodItem(
      id: 'food-004',
      snapId: 'snap-002',
      name: 'broccoli',
      processedLevel: 'Unprocessed',
      servings: '1',
      calories: 50,
    ),
    SnapFoodItem(
      id: 'food-005',
      snapId: 'snap-002',
      name: 'tomato',
      processedLevel: 'Unprocessed',
      servings: '1',
      calories: 17,
    ),
    SnapFoodItem(
      id: 'food-006',
      snapId: 'snap-003',
      name: 'pizza',
      processedLevel: 'Highly Processed',
      servings: '1',
      calories: 300,
    ),
    SnapFoodItem(
      id: 'food-007',
      snapId: 'snap-005',
      name: 'spinach',
      processedLevel: 'Unprocessed',
      servings: '1',
      calories: 7,
    ),
    SnapFoodItem(
      id: 'food-008',
      snapId: 'snap-004',
      name: 'pasta',
      processedLevel: 'Moderately Processed',
      servings: '1',
      calories: 328,
    ),
    SnapFoodItem(
      id: 'food-009',
      snapId: 'snap-004',
      name: 'creamy sauce',
      processedLevel: 'Highly Processed',
      servings: '1',
      calories: 233,
    ),
  ];

  void addSnapFoodItem({
    required String snapId,
    required String name,
    required String processedLevel,
    required String servings,
    required int calories,
  }) {
    String id = 'food-${(_snapFoodItems.length + 1).toString().padLeft(3, '0')}';
    SnapFoodItem data = SnapFoodItem(
      id: id,
      snapId: snapId,
      name: name,
      processedLevel: processedLevel,
      servings: servings,
      calories: calories,
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

 */