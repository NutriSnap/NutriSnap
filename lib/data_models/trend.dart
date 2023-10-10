import 'user.dart';

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