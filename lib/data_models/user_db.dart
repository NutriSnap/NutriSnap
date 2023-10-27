import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/data_models/user_challenge.dart';
import 'package:nutrisnap/data_models/user_badge.dart';
import 'meal.dart';

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.imagePath,
    this.phone,
    required this.initials,
  });
  String id;
  String name;
  String username;
  String email;
  String initials;
  String? imagePath;
  String? phone;
  // String? location = '';
  // String? role = '';
  // String bio = '';
  // bool isVerified = false;
  // List<String>? followers = [];
  // List<String>? following = [];
  // List<String>? savedMeals = [];
  // List<String>? savedSnaps = [];
  // List<String>? savedChallenges = [];
  // List<String>? savedBadges = [];

  UserData copyWith({
    String? id,
    String? name,
    String? username,
    String? email,
    String? imagePath,
    String? phone,
    String? initials,
    // ... any other optional fields you want to include ...
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      imagePath: imagePath ?? this.imagePath,
      phone: phone ?? this.phone,
      initials: initials ?? this.initials,
      // ... other fields ...
    );
  }
}

class UserDB {
  UserDB(this.ref);

  final ProviderRef<UserDB> ref;

  final List<UserData> _users = [
    UserData(
      id: 'user-001',
      name: 'Jenna Deane',
      username: '@fluke',
      email: 'jennacorindeane@gmail.com',
      imagePath: 'assets/images/user-001.jpg',
      phone: '808-123-4567',
      initials: 'JD',
    ),
    UserData(
      id: 'user-002',
      name: 'Jenna Smith',
      username: '@fluke',
      email: 'j_smith@hawaii.edu',
      phone: '',
      imagePath: 'assets/images/user-002.jpg',
      initials: 'JS',
    ),
    UserData(
      id: 'user-003',
      name: 'Katie Yamasaki',
      username: '@katie',
      email: 'katie.y@gmail.com',
      imagePath: 'assets/images/user-003.jpg',
      phone: '808-123-4567',
      initials: 'KY',
    )
  ];

  bool doesUserExist(String id) {
    return _users.any((u) => u.id == id);
  }

  UserData? getUser(String id) {
    return _users.firstWhere((u) => u.id == id);
  }

  List<String> getUserIDs() {
    return _users.map((user) => user.id).toList();
  }

  List<UserData> getUsers() {
    return _users.toList();
  }

  String getUserByUsername(String username) {
    return _users.firstWhere((user) => user.username == username).id;
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

  void addUser(UserData user) {
    _users.add(user);
  }

  void updateUser(UserData user) {
    if (!doesUserExist(user.id)) {
      throw Exception('User with id ${user.id} not found.');
    }

    UserData oldUser = getUser(user.id)!;
    UserData updatedUser = oldUser.copyWith(
      name: user.name,
      username: user.username,
      email: user.email,
      imagePath: user.imagePath,
      phone: user.phone,
      initials: user.initials,
      // ... other fields ...
    );

    int index = _users.indexWhere((u) => u.id == user.id);
    _users[index] =
        updatedUser; // Replace the old user with the updated user in the list
  }
}

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});

final currentUserIDProvider = StateProvider<String>((ref) {
  return 'user-003';
});
