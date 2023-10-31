import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/views/snaps/domain/snap_food_item.dart';

final snapFoodItemDBProvider = Provider<SnapFoodItemDB>((ref) {
  return SnapFoodItemDB(ref);
});