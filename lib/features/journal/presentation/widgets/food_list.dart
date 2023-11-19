import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/snaps/domain/snap.dart';
import 'package:nutrisnap/features/snaps/domain/snap_food_item.dart';

import '../../../all_data_provider.dart';
import '../../../ns_error.dart';
import '../../../ns_loading.dart';

class FoodList extends ConsumerWidget {
  const FoodList({
    super.key,
    required this.snap,
  });

  final Snap snap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
              context: context,
              snaps: allData.snaps,
              date: allData.date,
            ),
        loading: () => const NSLoading(),
        error: (error, st) => NSError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required List<Snap> snaps,
    required DateTime date,
  }) {
    final List<SnapFoodItem> snapFoodItemsList = snap.foodsList;
    final List<String> foodItems =
        snapFoodItemsList.map((e) => e.name).toList();
    final int foodsCount = snapFoodItemsList.length;
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
