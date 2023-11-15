import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nutrisnap/features/snaps/domain/meal_collection.dart';
// import 'package:nutrisnap/core/constants/app_colors.dart';
import 'package:nutrisnap/features/snaps/domain/snap.dart';
import 'package:nutrisnap/features/snaps/data/snap_provider.dart';
import 'package:nutrisnap/features/snaps/domain/snap_collection.dart';
import '../../../all_data_provider.dart';
import '../../../ns_error.dart';
import '../../../ns_loading.dart';
import '../../../snaps/data/meal_provider.dart';
import '../../../snaps/domain/meal.dart';
import '../../../snaps/domain/snap_food_item.dart';
import '../../../snaps/domain/snap_image.dart';
import 'food_list.dart';
import 'line_processing_indicator.dart';

class SnapCard extends ConsumerWidget {
  const SnapCard({Key? key, required this.snapId}) : super(key: key);

  final String snapId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final SnapDB snapDB = ref.watch(snapDBProvider);
    //Snap snap = snapDB.getSnap(snapId);
   // String meal = ref.watch(mealDBProvider).getMeal(snap.mealId).name;
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            snapFoodItems: allData.snapFoodItems,
            snaps: allData.snaps,
            meals: allData.meals,
            snapImages: allData.snapImages),
        loading: () => const NSLoading(),
        error: (error, st) => NSError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required List<SnapFoodItem> snapFoodItems,
      required List<Snap> snaps,
      required List<Meal> meals,
      required List<SnapImage> snapImages}) {
    SnapCollection snapCollection = SnapCollection(snaps);
    MealCollection mealCollection = MealCollection(meals);
    Snap snap = snapCollection.getSnap(snapId);
    String imageUrl = snap.imageUrl;
    String calories = snap.calories.toString();
    Image image = Image.asset(imageUrl, fit: BoxFit.cover);
    String meal = mealCollection.getMealBySnapId(snapId, snapCollection).name;
    //String date = DateFormat.yMMMd().format(snap.date).toString();
    return Card(
      //margin: EdgeInsets.zero, // Removes the default margin around the card
      clipBehavior: Clip.antiAlias,
      //child: Padding(padding: const EdgeInsets.all(24.0), // Padding around the card to space i
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Two columns 1. Text 2. Image
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns the text to the top
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  meal,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                    maxHeight: 100,
                  ),
                  child: FoodList(
                    snapId: snapId,
                  ), // This is a list that scrolls vertically and displays the food items
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 50,
                    ),
                    child: LineProcessingIndicator(
                        unprocessed: snap.unprocessedPercentage,
                        processed: snap.moderatelyProcessedPercentage,
                        ultraprocessed: snap.highlyProcessedPercentage)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$calories kcal',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ),
          SizedBox(
            //width: 150,
            //height: 150,
            child: AspectRatio(
              aspectRatio: 1,
              child: image,
            ), // This is the image, 150x150
          ),
        ],
      ),
      //),
    );
  }
}

// child: Image.asset(snapDB.getSnap('2').imageUrl, fit: BoxFit.cover),
