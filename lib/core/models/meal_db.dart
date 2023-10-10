class MealDB {
  final List<Meal> _meals = [
    Meal(
      id: 'm1',
      name: 'Breakfast',
      dateTime: DateTime.now(),
      totalCalories: 500,
      labeledItemsList: ['Eggs', 'Bread'],
      imagePath: 'path/to/image',
    ),
    // Add more meals...
  ];

  List<Meal> get meals => _meals;

  Meal getMeal(String id) => _meals.firstWhere((meal) => meal.id == id);
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
  String name;
  DateTime dateTime;
  int totalCalories;
  List<String> labeledItemsList;
  String imagePath;
}
