import 'package:flutter/material.dart';

import 'current_user_avatar.dart';
import 'message_box.dart';
import 'other_user_avatar.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({Key? key, required this.isCurrentUser, required this.messageSenderId, required this.messageText, required this.formattedTime}) : super(key: key);

  final bool isCurrentUser;
  final String messageSenderId;
  final String messageText;
  final String formattedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: isCurrentUser
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!isCurrentUser)
            OtherUserAvatar(otherUserName: messageSenderId),
          MessageBox(
              isCurrentUser: isCurrentUser,
              messageText: messageText,
              formattedTime: formattedTime),
          if (isCurrentUser)
            CurrentUserAvatar(currentUserName: messageSenderId),
        ],
      ),
    );
  }
}