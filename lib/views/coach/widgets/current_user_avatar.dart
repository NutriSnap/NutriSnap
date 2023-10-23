import 'package:flutter/material.dart';

class CurrentUserAvatar extends StatelessWidget {
  const CurrentUserAvatar({Key? key, required this.currentUserName}) : super(key: key);

  final String currentUserName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      //backgroundColor: Theme.of(context).colorScheme.primary, // for current user
      child: Text(currentUserName.substring(0, 2)),
    );
  }
}