import 'package:nutrisnap/core/models/data_models.dart';

class UserDB {
  User getUser(String userID) {
    return user1;
  }
}

// example data
User user1 = User(
  id: 'user-001',
  name: 'Jenna Deane',
  username: '@fluke',
  email: 'jennacorindeane@gmail.com',
  imagePath: 'assets/images/user-001.jpg',
  initials: 'JD',
);

User user2 = User(
  id: 'user-002',
  name: 'Jenna Deane',
  username: '@fluke',
  email: 'user2@gmail.com',
  imagePath: 'assets/images/user-002.jpg',
  initials: 'JD',
);
