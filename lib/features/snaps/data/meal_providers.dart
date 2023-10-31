import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/features/snaps/domain/meal.dart';

final mealDBProvider = Provider<MealDB>((ref) {
  return MealDB(ref);
});