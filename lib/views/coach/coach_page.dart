import 'package:flutter/material.dart';
import 'package:nutrisnap/views/coach/widgets/bot_message.dart';
import 'package:nutrisnap/views/coach/widgets/message_textfield.dart';
import 'package:nutrisnap/views/coach/widgets/user_message.dart';
import '../../../data_models/message.dart';

class CoachPage extends StatelessWidget {
  const CoachPage({Key? key}) : super(key: key);

  static const String routeName = '/coach';

  @override
  Widget build(BuildContext context) {
    List<Message> messages = messageDB.getMessagesByConversationId('1');
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final message = messages[index];
            bool isCurrentUser = message.senderId == '1';
            bool isAI = message.senderId == "aiAgent";
            String formattedTime = TimeOfDay.fromDateTime(
                DateTime.fromMillisecondsSinceEpoch(message.timestamp))
                .format(context);
            // Check if message is dismissed
            if (message.dismissed == true) {
              return const SizedBox
                  .shrink(); // render nothing for dismissed messages
            }
            if (isAI) {
              return BotMessage(messageId: message.id, messageText: message.message);
            }
            //String messageSenderName = userDB.getUser(message.senderId).name;
            return UserMessage(isCurrentUser: isCurrentUser, messageSenderId: message.senderId, messageText: message.message, formattedTime: formattedTime);
            //return UserMessage(isCurrentUser: isCurrentUser, messageSenderId: message.senderId, messageText: message.message, formattedTime: formattedTime,);
          }
      ),
      bottomSheet: const MessageTextfield(),
    );
  }
}