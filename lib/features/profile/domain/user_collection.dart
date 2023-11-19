import 'user.dart';

/// Encapsulates operations on the list of [User] returned from Firestore.
class UserCollection {
  UserCollection(users) : _users = users;

  final List<User> _users;

  int size() {
    return _users.length;
  }

  User get(int index) {
    return _users[index];
  }

  User getUser(String id) {
    return _users.firstWhere((user) => user.id == id);
  }

  List<String> getUserIds() {
    return _users.map((user) => user.id).toList();
  }

  List<User> getUsers() {
    return _users.toList();
  }

  List<User> getUsersByUserName(String userName) {
    return _users.where((user) => user.userName == userName).toList();
  }

  List<User> getUsersByImagePath(String imagePath) {
    return _users.where((user) => user.imagePath == imagePath).toList();
  }
}
