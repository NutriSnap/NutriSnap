import 'package:flutter/material.dart';

class MessageTextfield extends StatelessWidget {
  const MessageTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          decoration: InputDecoration(
            labelText: "Type a message",
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                // Later, this will send a message
              },
            ),
          ),
          onSubmitted: (message) {
            //handleMessageCommand(message);
            // Other message handling logic
          }),
    );
  }
}