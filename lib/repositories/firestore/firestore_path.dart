/// Defines the domain model path strings for [FirestoreService].
class FirestorePath {
  static String image(String imageId) => 'images/$imageId';
  static String images() => 'images';

  static String snap(String snapId) => 'snaps/$snapId';
  static String snaps() => 'snaps';

  static String meal(String mealId) => 'meals/$mealId';
  static String meals() => 'meals';

  static String snapFoodItem(String snapFoodItemId) => 'snapFoodItems/$snapFoodItemId';
  static String snapFoodItems() => 'snapFoodItems';
}
