import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/data_models/snap_food_item.dart';

final snapFoodItemDBProvider = Provider<SnapFoodItemDB>((ref) {
  return SnapFoodItemDB(ref);
});