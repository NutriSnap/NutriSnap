class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.imagePath,
    required this.initials,
  });
  String id;
  String name;
  String username;
  String email;
  String? imagePath;
  String initials;
}

class Meal {
  Meal({
    required this.id,
    required this.name,
    required this.dateTime,
    required this.totalCalories,
    required this.labeledItemsList,
    required this.imagePath,
  });
  String id;
  String name; // Breakfast, Lunch, etc.
  DateTime dateTime;
  int totalCalories;
  List<String> labeledItemsList; // list of item IDs
  String imagePath;
}

class ImageModel {
  ImageModel({
    required this.id,
    required this.path,
    required this.labelId,
  });
  String id;
  String path;
  String labelId; // could be mealId or itemId depending on your schema
}

class Challenge {
  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.endDate,
  });

  String id;
  String title;
  String description;
  DateTime creationDate;
  DateTime endDate;
}

class Trend {
  Trend({
    required this.id,
    required this.userId,
    required this.type, // e.g., 'calorie', 'mealType'
    required this.dataPoints, // Timestamp and value
  });
  String id;
  String userId;
  String type;
  List<Map<DateTime, dynamic>> dataPoints;
}

class Setting {
  Setting({
    required this.id,
    required this.userId,
    required this.theme,
    required this.notifications,
    required this.goals,
    required this.mindfulnessReminders,
    required this.appFeatures,
    required this.favoritePages,
  });
  String id;
  String userId;
  String theme; // e.g., 'light', 'dark'
  bool notifications;
  Map<String, dynamic> goals;
  List<DateTime> mindfulnessReminders; // Reminder times
  List<String> appFeatures; // Enabled features
  List<String> favoritePages;
}
