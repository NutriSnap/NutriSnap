import 'package:flutter/material.dart';

class BotMessageTextField extends StatelessWidget {
  const BotMessageTextField({Key? key, required this.messageText}) : super(key: key);

  final String messageText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8.0,
        left: 50.0,
        right: 50.0,
      ),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
        //border: Border.all(
          //color: Colors.purple[900]!,
          //width: 1,
        //),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Vertical offset
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            messageText,
            textAlign: TextAlign.left,
            style: const TextStyle(
              //color: Colors.purple[900],
              //fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  // Logic for seen
                  print("Seen");
                },
                icon: const Icon(Icons.check,
                    color: Colors.green),
              ),
              IconButton(
                onPressed: () {
                  // Logic for follow up
                  print("Follow Up");
                },
                icon: const Icon(Icons.question_answer,
                    color: Colors.blue),
              ),
              IconButton(
                onPressed: () {
                  // Logic for dismiss
                  //dismissMessage(message["messageId"]);
                },
                icon:
                const Icon(Icons.close, color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}