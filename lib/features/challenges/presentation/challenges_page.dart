import 'package:flutter/material.dart';
import 'package:nutrisnap/features/challenges/widgets/challenges_card.dart';

List<ChallengesCard> _buildGridCards(int count) {
  List<ChallengesCard> cards = List.generate(
    count,
    (int index) {
      return const ChallengesCard();
    },
  );
  return cards;
}

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  static const String routeName = '/challenges';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: GridView.count(
        crossAxisCount: 1,
        padding: const EdgeInsets.all(2.0),
        childAspectRatio: 16.0 / 9.0,
        children: _buildGridCards(4),
      ),
    );
  }
}
