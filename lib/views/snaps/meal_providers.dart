import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/data_models/meal.dart';

final mealDBProvider = Provider<MealDB>((ref) {
  return MealDB(ref);
});