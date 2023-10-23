import 'package:flutter/material.dart';
import 'package:nutrisnap/views/coach/widgets/bot_message.dart';
import 'package:nutrisnap/views/coach/widgets/message_textfield.dart';
import 'package:nutrisnap/views/coach/widgets/user_message.dart';

/// This is for working in dartpad.dev
// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CoachPage(),
//     );
//   }
// }

class CoachPage extends StatefulWidget {
  const CoachPage({super.key});

  static const String routeName = '/coach';

  @override
  State<CoachPage> createState() => _CoachPageState();
}

class _CoachPageState extends State<CoachPage> {
  // ...Fake Data with an AI message included
  Map<String, dynamic> fakeData = {
    "conversations": {
      "conversationId1": {
        "userIds": ["userId1", "userId2"],
        "messages": [
          {
            "messageId": "msgId1",
            "senderId": "userId1",
            "message": "Hello! How can I help you with your nutrition today?",
            "timestamp": 1676533248000,
            "messageType": "text",
            "dismissed": false,
          },
          {
            "messageId": "msgId2",
            "senderId": "userId2",
            "message": "Hi! I need some advice on a good protein source.",
            "timestamp": 1676533258000,
            "messageType": "text",
            "dismissed": false,
          },
          {
            "messageId": "msgId3",
            "senderId": "userId1",
            "message":
                "Sure! Chickpeas, lentils, and tofu are excellent sources of protein.",
            "timestamp": 1676533268000,
            "messageType": "text",
            "dismissed": false,
          },
          {
            "messageId": "msgId4",
            "senderId": "aiAgent",
            "message":
                "It seems like you're discussing various protein sources! According to the NOVA classification:\n- Chickpeas and lentils are 'unprocessed or minimally processed foods'.\n- Tofu is 'processed culinary ingredient'.\nWould you like tips on incorporating these into a balanced diet?",
            "timestamp": 1676533298000,
            "messageType": "text",
            "dismissed": false,
          },
          {
            "messageId": "msgId4",
            "senderId": "aiAgent",
            "message": "It seems like...",
            "timestamp": 1676533298000,
            "messageType": "text",
            "dismissed": true,
          },
        ]
      },
    }
  };
  String currentUser = "userId2";

  // Function to dismiss a message
  void dismissMessage(String messageId) {
    setState(() {
      // Locate and update the message to be "dismissed" in your state/data.
      // Mark it as "dismissed": true and filter them out when displaying.
      for (var msg in fakeData["conversations"]["conversationId1"]
          ["messages"]) {
        if (msg["messageId"] == messageId) {
          msg["dismissed"] = true;
        }
      }
    });
  }

  void handleMessageCommand(String message) {
    if (message.startsWith("/nova")) {
      // Logic to handle "/nova" command
      // Analyze last 2-3 messages for food items and send a new AI message with NOVA classification info
    }
  }

  void handleNovaCommand() {
    // Analyze last 2-3 messages and detect food items (statically or using some keyword matching logic)
    // Create a message with NOVA classification info for detected foods and add it to the message list
    setState(() {
      // Update message list state
    });
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> messages =
        fakeData["conversations"]["conversationId1"]["messages"];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      // appBar: AppBar(title: const Text('Chat')),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          bool isCurrentUser = message["senderId"] == currentUser;
          bool isAI = message["senderId"] == "aiAgent";

          String formattedTime = TimeOfDay.fromDateTime(
                  DateTime.fromMillisecondsSinceEpoch(message["timestamp"]))
              .format(context);

          // Check if message is dismissed
          if (message["dismissed"] == true) {
            return const SizedBox
                .shrink(); // render nothing for dismissed messages
          }

          if (isAI) {
            return BotMessage(messageId: message["messageId"], messageText: message["message"]);
          }

          return UserMessage(isCurrentUser: isCurrentUser, messageSenderId: message["senderId"], messageText: message["message"], formattedTime: formattedTime,);
        },
      ),
      bottomSheet: const MessageTextfield(),
    );
  }
}
