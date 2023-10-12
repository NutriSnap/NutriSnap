import 'package:flutter/material.dart';

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
            return Dismissible(
              key: Key(message["messageId"]),
              onDismissed: (_) => dismissMessage(message["messageId"]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          NetworkImage('https://robohash.org/ai-agent.png'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 8.0,
                        left: 50.0,
                        right: 50.0,
                      ),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.purple[900]!,
                          width: 1,
                        ),
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
                            message["message"],
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.purple[900],
                              fontWeight: FontWeight.bold,
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
                                  dismissMessage(message["messageId"]);
                                },
                                icon:
                                    const Icon(Icons.close, color: Colors.red),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: isCurrentUser
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                if (!isCurrentUser)
                  CircleAvatar(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondary, // for non-current user

                    child: Text(message["senderId"].toString().substring(0, 2)),
                  ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width *
                        0.6, // max 60% of screen width
                  ),
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: isCurrentUser
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
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
                        message["message"],
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
                ),
                if (isCurrentUser)
                  CircleAvatar(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primary, // for current user
                    child: Text(currentUser.substring(0, 2)),
                  ),
              ],
            ),
          );
        },
      ),
      bottomSheet: Padding(
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
              handleMessageCommand(message);
              // Other message handling logic
            }),
      ),
    );
  }
}
