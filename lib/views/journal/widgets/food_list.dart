import 'package:flutter/material.dart';
import '../../../data_models/snap.dart';
import '../../../data_models/snap_food_item.dart';

class FoodList extends StatelessWidget {
  FoodList({super.key});

  List<String> foodItems = snapFoodItemDB.getSnapFoodItemNamesBySnapId('2');

  var foodsCount = snapDB.getAssociatedSnapFoodItems('2').length;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: Text(foodItems[index]),

      );
    });
  }
}