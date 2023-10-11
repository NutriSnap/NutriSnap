import 'package:flutter/material.dart';
import '../../../data_models/snap.dart';
import '../../../data_models/snap_food_item.dart';

class FoodList extends StatelessWidget {
  final List<String> foodItems;
  final int foodsCount;

  FoodList({Key? key})
      : foodItems = snapFoodItemDB.getSnapFoodItemNamesBySnapId('2'),
        foodsCount = snapDB.getAssociatedSnapFoodItems('2').length,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: foodsCount + 1, // Added 1 for the final divider
      itemBuilder: (context, index) {
        if (index == foodsCount) {
          // This is the last item, return a divider
          return const Divider(
            color: Colors.black,
            height: 0.2,
          );
        }
        // Otherwise, return a regular item
        return Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Row(
            children: [
              Text('${index + 1}. ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium), // Adjusted text style
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
        color: Colors.black,
        height: 0.2,
      ),
    );
  }
}
