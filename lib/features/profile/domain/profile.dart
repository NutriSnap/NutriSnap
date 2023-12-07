import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

/// Profile Document.
/// You must tell Firestore to use the 'id' field as the documentID
@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    String? imagePath,
    required String initials,
  }) = _Profile;

  const Profile._();

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  // Test that the json file can be converted into entities.
  static Future<List<Profile>> checkInitialData() async {
    String content =
        await rootBundle.loadString("assets/initialData/profiles.json");
    List<dynamic> initialData = json.decode(content);
    return initialData.map((jsonData) => Profile.fromJson(jsonData)).toList();
  }
}
