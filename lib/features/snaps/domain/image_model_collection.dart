import 'image_model.dart';

class ImageCollection {
  ImageCollection(images): _images = images;

  final List<Image> _images;

  List<Image> get images => _images;

  Image getImage(String id) {
    return _images.firstWhere((image) => image.id == id);
  }

  Image getImageBySnapId(String snapId) {
    return _images.firstWhere((image) => image.snapId == snapId);
  }

  List<Image> getImages(List<String> ids) {
    return _images.where((image) => ids.contains(image.id)).toList();
  }
}