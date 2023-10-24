import 'package:flutter/material.dart';

class BotAvatar extends StatelessWidget {
  const BotAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      backgroundImage:
      const NetworkImage('https://robohash.org/ai-agent.png'),
    );
  }
}