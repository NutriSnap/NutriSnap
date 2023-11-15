import 'snap_image.dart';

class SnapImageCollection {
  SnapImageCollection(images): _images = images;

  final List<SnapImage> _images;

  List<SnapImage> get images => _images;

  SnapImage getImage(String id) {
    return _images.firstWhere((image) => image.id == id);
  }

  SnapImage getImageBySnapId(String snapId) {
    return _images.firstWhere((image) => image.snapId == snapId);
  }

  List<SnapImage> getImages(List<String> ids) {
    return _images.where((image) => ids.contains(image.id)).toList();
  }
}