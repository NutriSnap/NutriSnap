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