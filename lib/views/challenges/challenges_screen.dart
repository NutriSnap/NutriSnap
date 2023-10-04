import 'package:flutter/material.dart';
import 'package:nutrisnap/views/challenges/widgets/challenges_card.dart';

List<ChallengesCard> _buildGridCards(int count) {
  List<ChallengesCard> cards = List.generate(
    count,
        (int index) {
      return const ChallengesCard();
    },
  );
  return cards;
}

class ChallengesScreen extends StatelessWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  static const String routeName = '/challenges';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 1,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 16.0 / 9.0,
        children: _buildGridCards(4),
      ),
    );
  }
}
