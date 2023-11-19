/// Defines the domain model path strings for [FirestoreService].
/// This is a class of static methods, so it should be instantiated as:
/// `FirestorePath.snapImage(snapImageId)`
/// `FirestorePath.snapImages()`
/// `FirestorePath.snap(snapId)`
/// `FirestorePath.snaps()`
///
/// This is to access the Firestore collections and documents.
class FirestorePath {
  static String snapImage(String snapImageId) => 'snapImages/$snapImageId';
  static String snapImages() => 'snapImages';

  static String snap(String snapId) => 'snaps/$snapId';
  static String snaps() => 'snaps';

  static String meal(String mealId) => 'meals/$mealId';
  static String meals() => 'meals';

  static String snapFoodItem(String snapFoodItemId) =>
      'snapFoodItems/$snapFoodItemId';
  static String snapFoodItems() => 'snapFoodItems';

  static String teamMember(String teamMemberId) => 'teamMembers/$teamMemberId';
  static String teamMembers() => 'teamMembers';

  static String user(String userId) => 'users/$userId';
  static String users() => 'users';
}
