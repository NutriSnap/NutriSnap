import 'snap.dart';
import 'snap_image.dart';
import 'snap_image_collection.dart';
import 'snap_food_item.dart';
import 'snap_food_item_collection.dart';

class SnapCollection {
  SnapCollection(snaps): _snaps = snaps;

  final List<Snap> _snaps;

  List<Snap> get snaps => _snaps;

  List<Snap> getSnapsByOwnerId(String owner) {
    return _snaps
        .where((snap) => snap.owner == owner) // Filters the snaps based on ownerId
        .toList();
  }

  List<Snap> getSnaps() {
    return _snaps.toList();
  }

/*
  UserData getAssociatedUser(String snapId) {
    Snap data = getSnap(snapId);
    final UserDB userDB = ref.watch(userDBProvider);
    return userDB.getUser(data.ownerId);
  }
 */

  SnapImage getAssociatedSnapImage(String snapId, SnapImageCollection snapImageCollection) {
    return snapImageCollection.getImageBySnapId(snapId);
  }
}