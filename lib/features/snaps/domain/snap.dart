import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/profile/user_providers.dart';
import 'package:nutrisnap/features/snaps/data/snap_food_item_providers.dart';
import '../../profile/domain/user_db.dart';
import 'image_model.dart';
import 'snap_food_item.dart';

class Snap {
  Snap({
    required this.id,
    required this.ownerId,
    required this.mealId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    //required this.lat,
    //required this.long,
    List<String>? foodsList
  }) : foodsList = foodsList ?? []; // list of SnapFoodItem ids

  String id;
  String ownerId;
  String mealId;
  String title;
  String description;
  String imageUrl;
  DateTime date;
  //Double lat;
  //Double long;
  List<String> foodsList;
}

class SnapDB {
  SnapDB(this.ref);
  final ProviderRef<SnapDB> ref;
  final List<Snap> _snaps = [
    Snap(
        id: 'snap-001',
        ownerId: '1',
        mealId: 'meal-001',
        title: 'Snap 1',
        description: 'Snap 1 description',
        imageUrl: 'assets/images/food/coffee.jpg',
        date: DateTime.parse('2023-07-23 20:22:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['food-001']),
    Snap(
        id: 'snap-002',
        ownerId: 'user-003',
        mealId: 'meal-002',
        title: 'Snap 2',
        description: 'Snap 2 description',
        imageUrl: 'assets/images/food/rice-chicken.jpg',
        date: DateTime.parse('2023-07-22 14:18:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['food-002', 'food-003', 'food-004', 'food-005']),
    Snap(
        id: 'snap-003',
        ownerId: 'user-003',
        mealId: 'meal-003',
        title: 'Snap 3',
        description: 'Snap 3 description',
        imageUrl: 'assets/images/food/pizza.jpg',
        date: DateTime.parse('2023-07-19 08:18:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['food-006']),
    Snap(
        id: 'snap-004',
        ownerId: 'user-003',
        mealId: 'meal-004',
        title: 'Snap 4',
        description: 'Snap 4 description',
        imageUrl: 'assets/images/food/carbonara.jpg',
        date: DateTime.parse('2023-07-21 17:18:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['food-008', 'food-009']),
    Snap(
        id: 'snap-005',
        ownerId: 'user-003',
        mealId: 'meal-005',
        title: 'Snap 5',
        description: 'Snap 5 description',
        imageUrl: 'assets/images/food/spinach.jpg',
        date: DateTime.parse('2023-07-20 20:18:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['food-007']),
  ];

  void addSnap({
    required String ownerId,
    required String mealId,
    required String title,
    required String description,
    required String imageUrl,
  }) {
    String id = 'snap-${(_snaps.length + 1).toString().padLeft(3, '0')}';
    DateTime date = DateTime.now();
    Snap data = Snap(
      id: id,
      ownerId: ownerId,
      mealId: mealId,
      title: title,
      description: description,
      imageUrl: imageUrl,
      date: date,
    );
    _snaps.add(data);
  }

  Snap getSnap(String snapId) {
    return _snaps.firstWhere((snap) => snap.id == snapId);
  }

  List<String> getSnapIds() {
    return _snaps.map((snap) => snap.id).toList();
  }

  List<Snap> getSnaps() {
    return _snaps.toList();
  }

  Image getAssociatedImage(String snapId) {
    Snap data = getSnap(snapId);
    return imageDB.getImage(data.imageUrl);
  }

  UserData getAssociatedUser(String snapId) {
    Snap data = getSnap(snapId);
    final UserDB userDB = ref.watch(userDBProvider);
    return userDB.getUser(data.ownerId);
  }

  List<String> getAssociatedSnapFoodItemIds(List<String> foodsList) {
    List<String> snapFoodItemIds = [];
    final SnapFoodItemDB snapFoodItemDB = ref.watch(snapFoodItemDBProvider);
    for (String foodId in foodsList) {
      snapFoodItemIds.add(snapFoodItemDB.getSnapFoodItemId(foodId));
    }
    return snapFoodItemIds;
  }

  List<SnapFoodItem> getAssociatedSnapFoodItems(String snapId) {
    final SnapFoodItemDB snapFoodItemDB = ref.watch(snapFoodItemDBProvider);
    return snapFoodItemDB.getSnapFoodItemsBySnapId(snapId);
  }

  List<String> getSnapIdsByMealId(String mealId) {
    return _snaps
        .where((snap) =>
            snap.mealId == mealId) // Filters the snaps based on mealId
        .map((snap) => snap.id)
        .toList();
  }
}

/// The singleton instance of a snapDB used by clients to access snap data.
// SnapDB snapDB = SnapDB();
