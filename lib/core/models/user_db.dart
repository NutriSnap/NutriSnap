import 'dart:math';

class UserData {
  UserData({
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
  final List<UserData> _users = [
    UserData(
        id: '1',
        name: 'Alice',
        username: 'alice01',
        email: 'alice01@example.com',
        imagePath: null,
        initials: 'A'),
    UserData(
        id: '2',
        name: 'Bob',
        username: 'bob02',
        email: 'bob02@example.com',
        imagePath: null,
        initials: 'B'),
    UserData(
        id: '3',
        name: 'Charlie',
        username: 'charlie03',
        email: 'charlie03@example.com',
        imagePath: null,
        initials: 'C'),
  ];

  List<UserData> get users => _users;

  UserData getUser(String id) => _users.firstWhere((user) => user.id == id);

  // get associated users
  List<UserData> getAssociatedUsers(String id) {
    return _users.where((user) => user.id != id).toList();
  }
}

UserDB userDB = UserDB();

String getRandomUser() {
  final random = Random();
  final randomUser = userDB.users[random.nextInt(userDB.users.length)];
  return randomUser.id;
}

String currentUserId = getRandomUser();
