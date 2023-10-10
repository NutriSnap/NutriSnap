import 'dart:ffi';
import 'image_model.dart';
import 'user.dart';
import 'snap_food_item.dart';

class Snap {
  Snap({
    required this.id,
    required this.ownerId,
    required this.mealId,
    required this.title,
    required this.description,
    required this.imageId,
    required this.date,
    //required this.lat,
    //required this.long,
    List<String>? foodsList})
      : foodsList = foodsList ?? []; // list of SnapFoodItem ids

  String id;
  String ownerId;
  String mealId;
  String title;
  String description;
  String imageId;
  DateTime date;
  //Double lat;
  //Double long;
  List<String> foodsList;
}

class SnapDB {
  final List<Snap> _snaps = [
    Snap(
      id: '1',
      ownerId: '1',
      mealId: '1',
      title: 'Snap 1',
      description: 'Snap 1 description',
      imageId: '1',
      date: DateTime.now(),
      //lat: 0.0,
      //long: 0.0,
      foodsList: ['1', '2', '3']
    ),
    Snap(
      id: '2',
      ownerId: '2',
      mealId: '2',
      title: 'Snap 2',
      description: 'Snap 2 description',
      imageId: '2',
      date: DateTime.now(),
      //lat: 0.0,
      //long: 0.0,
      foodsList: ['4', '5', '6']
    ),
    Snap(
      id: '3',
      ownerId: '3',
      mealId: '3',
      title: 'Snap 3',
      description: 'Snap 3 description',
      imageId: '3',
      date: DateTime.now(),
      //lat: 0.0,
      //long: 0.0,
      foodsList: ['1', '3', '5']
    ),
    Snap(
      id: '4',
      ownerId: '4',
      mealId: '4',
      title: 'Snap 4',
      description: 'Snap 4 description',
      imageId: '4',
      date: DateTime.now(),
      //lat: 0.0,
      //long: 0.0,
        foodsList: ['2', '3', '6']
    ),
    Snap(
      id: '5',
      ownerId: '5',
      mealId: '5',
      title: 'Snap 5',
      description: 'Snap 5 description',
      imageId: '5',
      date: DateTime.now(),
      //lat: 0.0,
      //long: 0.0,
        foodsList: ['4', '1', '5']
    ),
  ];

  Snap getSnap(String snapId) {
    return _snaps.firstWhere((snap) => snap.id == snapId);
  }

  List<String> getSnapIds() {
    return _snaps.map((snap) => snap.id).toList();
  }

  Image getAssociatedImage(String snapId) {
    Snap data = snapDB.getSnap(snapId);
    return imageDB.getImage(data.imageId);
  }

  User getAssociatedUser(String snapId) {
    Snap data = snapDB.getSnap(snapId);
    return userDB.getUser(data.ownerId);
  }

  List<String> getAssociatedSnapFoodItemIds(List<String> foodsList) {
    List<String> snapFoodItemIds = [];
    for (String foodId in foodsList) {
      snapFoodItemIds.add(snapFoodItemDB.getSnapFoodItemId(foodId));
    }
    return snapFoodItemIds;
  }

  List<String> getSnapIdsByMealId(String mealId) {
    return _snaps
        .where((snap) => snap.mealId == mealId) // Filters the snaps based on mealId
        .map((snap) => snap.id)
        .toList();
  }


}

/// The singleton instance of a snapDB used by clients to access snap data.
SnapDB snapDB = SnapDB();