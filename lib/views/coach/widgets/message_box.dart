import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key, required this.isCurrentUser, required this.messageText, required this.formattedTime}) : super(key: key);

  final bool isCurrentUser;
  final String messageText;
  final String formattedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *
            0.6, // max 60% of screen width
      ),
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isCurrentUser
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(10),
        //box shadow
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(2, 3), // Vertical offset
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            messageText,
            style: TextStyle(
              color: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.color, // Adapts to theme
            ),
          ),
          Text(
            'Sent on $formattedTime',
            // ' - 12:34 PM
            style: TextStyle(
              fontSize: 10.0,
              color: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.color, // Adapts to theme
            ),
          ),
        ],
      ),
    );
  }
}