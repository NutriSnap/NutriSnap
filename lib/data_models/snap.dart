import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/views/profile/user_providers.dart';
import 'package:nutrisnap/views/snaps/snap_food_item_providers.dart';

import 'image_model.dart';
import 'user_db.dart';
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
        id: '1',
        ownerId: '1',
        mealId: '1',
        title: 'Snap 1',
        description: 'Snap 1 description',
        imageUrl: 'assets/images/food/coffee.jpg',
        date: DateTime.parse('2023-07-23 20:22:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['1']),
    Snap(
        id: '2',
        ownerId: 'user-003',
        mealId: '2',
        title: 'Snap 2',
        description: 'Snap 2 description',
        imageUrl: 'assets/images/food/rice-chicken.jpg',
        date: DateTime.parse('2023-07-22 14:18:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['2', '3', '4', '5']),
    Snap(
        id: '3',
        ownerId: 'user-003',
        mealId: '3',
        title: 'Snap 3',
        description: 'Snap 3 description',
        imageUrl: 'assets/images/food/pizza.jpg',
        date: DateTime.parse('2023-07-19 08:18:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['6']),
    Snap(
        id: '4',
        ownerId: 'user-003',
        mealId: '4',
        title: 'Snap 4',
        description: 'Snap 4 description',
        imageUrl: 'assets/images/food/carbonara.jpg',
        date: DateTime.parse('2023-07-21 17:18:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['8', '9']),
    Snap(
        id: '5',
        ownerId: 'user-003',
        mealId: '5',
        title: 'Snap 5',
        description: 'Snap 5 description',
        imageUrl: 'assets/images/food/spinach.jpg',
        date: DateTime.parse('2023-07-20 20:18:04Z'),
        //lat: 0.0,
        //long: 0.0,
        foodsList: ['7']),
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
