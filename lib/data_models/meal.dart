class Meal {
  Meal({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.unprocessedPercentage,
    required this.moderatelyProcessedPercentage,
    required this.highlyProcessedPercentage,
    required this.snapsList,
    required this.imagePath,
  });
  String id;
  String name; // Breakfast, Lunch, etc.
  DateTime dateTime;
  double unprocessedPercentage;
  double moderatelyProcessedPercentage;
  double highlyProcessedPercentage;
  List<String> snapsList; // list of snap IDs
  String imagePath;
}

List<String> getAssociatedSnapIds(String mealId) {
  return getSnapIds()
      .where((snapId) => getSnap(snapId).mealId == mealId)
      .toList();
}