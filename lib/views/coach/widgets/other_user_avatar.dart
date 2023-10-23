import 'package:flutter/material.dart';

class OtherUserAvatar extends StatelessWidget {
  const OtherUserAvatar({Key? key, required this.otherUserName}) : super(key: key);

  final String otherUserName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer, // for non-current user
      child: Text(otherUserName.substring(0, 2)),
    );
  }
}