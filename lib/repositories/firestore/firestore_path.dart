/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String snapImage(String snapImageId) => 'snapImages/$snapImageId';
  static String snapImages() => 'snapImages';

  static String snap(String snapId) => 'snaps/$snapId';
  static String snaps() => 'snaps';

  static String meal(String mealId) => 'meals/$mealId';
  static String meals() => 'meals';

  static String snapFoodItem(String snapFoodItemId) => 'snapFoodItems/$snapFoodItemId';
  static String snapFoodItems() => 'snapFoodItems';
}
