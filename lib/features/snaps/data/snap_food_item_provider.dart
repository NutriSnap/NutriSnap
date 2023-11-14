import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:nutrisnap/features/snaps/data/snap_food_item_database.dart';
import 'package:nutrisnap/features/snaps/domain/snap_food_item.dart';
part 'snap_food_item_provider.g.dart';

@riverpod
SnapFoodItemDatabase snapFoodItemDatabase(SnapFoodItemDatabaseRef ref) {
  return SnapFoodItemDatabase(ref);
}

@riverpod
Stream<List<SnapFoodItem>> snapFoodItems(SnapFoodItemsRef ref) {
  final database = ref.watch(snapFoodItemDatabaseProvider);
  return database.watchSnapFoodItems();
}