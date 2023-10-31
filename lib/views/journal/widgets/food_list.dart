import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/views/snaps/data/snap_food_item_providers.dart';

import 'package:nutrisnap/views/snaps/data/snap_providers.dart';
import '../../snaps/domain/snap.dart';
import '../../snaps/domain/snap_food_item.dart';

class FoodList extends ConsumerWidget {
  final String snapId;
  /*
  final List<String> foodItems;
  final int foodsCount;


  FoodList({Key? key, required this.snapId})
      : foodItems = snapFoodItemDB.getSnapFoodItemNamesBySnapId(snapId),
        foodsCount = snapDB.getAssociatedSnapFoodItems(snapId).length,
        super(key: key);

   */
  const FoodList({Key? key, required this.snapId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SnapDB snapDB = ref.watch(snapDBProvider);
    final SnapFoodItemDB snapFoodItemDB = ref.watch(snapFoodItemDBProvider);

    final List<String> foodItems = snapFoodItemDB.getSnapFoodItemNamesBySnapId(snapId);
    final int foodsCount = snapDB.getAssociatedSnapFoodItems(snapId).length;

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
