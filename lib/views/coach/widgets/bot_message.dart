import 'package:flutter/material.dart';

import 'bot_avatar.dart';
import 'bot_message_textfield.dart';

class BotMessage extends StatelessWidget {
  const BotMessage({Key? key, required this.messageId, required this.messageText}) : super(key: key);

  final String messageId;
  final String messageText;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(messageId),
      //onDismissed: (_) => dismissMessage(messageId),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            const BotAvatar(),
            BotMessageTextField(messageText: messageText),
          ],
        ),
      ),
    );
  }
}