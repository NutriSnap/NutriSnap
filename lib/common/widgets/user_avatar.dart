import 'package:flutter/material.dart';
import 'package:nutrisnap/data_models/user_db.dart';

/// Returns a CircleAvatar with either an image if available or initials, plus a label.
class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.userID}) : super(key: key);

  final String userID;

  @override
  Widget build(BuildContext context) {
    UserData data = userDB.getUser(userID);
    bool hasImagePath = data.imagePath != null;
    return (hasImagePath)
        ? CircleAvatar(
            backgroundImage: AssetImage(data.imagePath!),
          )
        : CircleAvatar(
            child: Text(data.initials),
          );
  }
}
