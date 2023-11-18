import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'journal/data/date_provider.dart';
import 'snaps/data/image_provider.dart';
import 'snaps/domain/snap_image.dart';
import 'snaps/data/meal_provider.dart';
import 'snaps/domain/meal.dart';
import 'snaps/data/snap_provider.dart';
import 'snaps/domain/snap.dart';
import 'snaps/data/snap_food_item_provider.dart';
import 'snaps/domain/snap_food_item.dart';

part 'all_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class AllData {
  AllData(
      {required this.snapImages,
        required this.meals,
        required this.snaps,
        required this.snapFoodItems,
        required this.date,
        //required this.currentUserID
        });

  final List<SnapImage> snapImages;
  final List<Meal> meals;
  final List<Snap> snaps;
  final List<SnapFoodItem> snapFoodItems;
  final DateTime date;
  //final String currentUserID;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final snapImages = ref.watch(snapImagesProvider.future);
  final meals = ref.watch(mealsProvider.future);
  final snaps = ref.watch(snapsProvider.future);
  final snapFoodItems = ref.watch(snapFoodItemsProvider.future);
  final date = ref.watch(dateProvider);
  //final currentUserID = ref.watch(currentUserIDProvider);
  return AllData(
    snapImages: await snapImages,
      meals: await meals,
      snaps: await snaps,
      snapFoodItems: await snapFoodItems,
      date: date,
      //currentUserID: currentUserID
      );
}