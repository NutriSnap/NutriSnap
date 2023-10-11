import 'package:flutter/material.dart';
import 'user_avatar.dart';

/// Returns a CircleAvatar with either an image if available or initials, plus a label.
class UserLabeledAvatar extends StatelessWidget {
  const UserLabeledAvatar(
      {Key? key, required this.userID, this.label = '', this.rightPadding = 0})
      : super(key: key);

  final String userID;
  final String label;
  final double rightPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [UserAvatar(userID: userID), Text(label)]),
        SizedBox(width: rightPadding)
      ],
    );
  }
}
