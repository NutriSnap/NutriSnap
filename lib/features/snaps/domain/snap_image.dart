import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'snap_image.freezed.dart';
part 'snap_image.g.dart';

@freezed
class SnapImage with _$SnapImage {
  const factory SnapImage({
    required String id,
    required String path,
    //required String labelId,
    required String snapId,
  }) = _SnapImage;

  factory SnapImage.fromJson(Map<String, dynamic> json) => _$SnapImageFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<SnapImage>> checkInitialData() async {
    String content =
    await rootBundle.loadString("assets/initialData/images.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => SnapImage.fromJson(jsonData)).toList();
  }
}

/*
class Image {
  Image({
    required this.id,
    required this.path,
    //required this.labelId,
    required this.snapId,
  });
  String id;
  String path;
  //String labelId; // could be mealId or itemId depending on your schema
  String snapId;
}

class ImageDB {
  final List<Image> _images = [
    Image(
      id: '1',
      path: 'assets/images/meal1.jpg',
      //labelId: '1',
      snapId: '1',
    ),
    Image(
      id: '2',
      path: 'assets/images/meal2.jpg',
      //labelId: '2',
      snapId: '2',
    ),
    Image(
      id: '3',
      path: 'assets/images/meal3.jpg',
      //labelId: '3',
      snapId: '3',
    ),
    Image(
      id: '4',
      path: 'assets/images/meal4.jpg',
      //labelId: '4',
      snapId: '4',
    ),
    Image(
      id: '5',
      path: 'assets/images/meal5.jpg',
      //labelId: '5',
      snapId: '5',
    ),
  ];

  Image getImage(String imageId) {
    return _images.firstWhere((image) => image.id == imageId);
  }

  List<String> getImageIds() {
    return _images.map((image) => image.id).toList();
  }
}

ImageDB imageDB = ImageDB();
*/