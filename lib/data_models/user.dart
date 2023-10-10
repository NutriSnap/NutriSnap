import 'package:nutrisnap/data_models/user_challenge.dart';
import 'package:nutrisnap/data_models/user_badge.dart';

import 'meal.dart';

class User {
  User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.imagePath,
    required this.initials,
  });
  String id;
  String name;
  String username;
  String email;
  String? imagePath;
  String initials;
}

class UserDB {
  final List<User> _users = [
    User(
      id: 'user-001',
      name: 'Jenna Deane',
      username: '@fluke',
      email: 'jennacorindeane@gmail.com',
      imagePath: 'assets/images/user-001.jpg',
      initials: 'JD',
    ),
    User(
      id: 'user-002',
      name: 'Jenna Smith',
      username: '@fluke',
      email: 'j_smith@hawaii.edu',
      imagePath: 'assets/images/user-002.jpg',
      initials: 'JS',
    ),
    User(
      id: 'user-003',
      name: 'Katie Yamasaki',
      username: '@katie',
      email: 'katie.y@gmail.com',
      imagePath: 'assets/images/user-003.jpg',
      initials: 'KY',
    )
  ];

  User getUser(String userID) {
    return _users.firstWhere((user) => user.id == userID);
  }

  List<String> getUserIDs() {
    return _users.map((user) => user.id).toList();
  }

  List<String> getAssociatedMealIds(String userId) {
    return mealDB.getMealIdsByOwnerId(userId);
  }

  List<String> getAssociatedChallengeIds(String userId) {
    return challengeProgressDB.getChallengeProgressIdsByUser(userId);
  }

  List<String> getAssociatedUserBadgeIds(String userId) {
    return userBadgeDB.getUserBadgeIdsByUser(userId);
  }

}

/// The singleton instance providing access to all user data for clients.
UserDB userDB = UserDB();

/// The currently logged in user.
String currentUserID = 'user-003';