import 'package:flutter/material.dart';
import '../../../data_models/snap.dart';
import '../../../data_models/snap_food_item.dart';

class FoodList extends StatelessWidget {
  final List<String> foodItems;
  final int foodsCount;
  final String snapId;

  FoodList({Key? key, required this.snapId})
      : foodItems = snapFoodItemDB.getSnapFoodItemNamesBySnapId(snapId),
        foodsCount = snapDB.getAssociatedSnapFoodItems(snapId).length,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: foodsCount + 1, // Added 1 for the final divider
      itemBuilder: (context, index) {
        if (index == foodsCount) {
          // This is the last item, return a divider
          return const Divider(
            color: Colors.transparent,
            height: 0.2,
          );
        }
        // Otherwise, return a regular item
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 2.0, right: 8.0),
          child: Row(
            children: [
              /*Text('${index + 1}. ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium), // Adjusted text style*/
              Expanded(
                child: Text(
                  foodItems[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium, // Adjusted text style
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.transparent,
        height: 0.2,
      ),
    );
  }
}
