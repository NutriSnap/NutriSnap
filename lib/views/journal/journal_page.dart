import 'package:flutter/material.dart';
import 'package:nutrisnap/views/journal/widgets/snap_card.dart';

List<SnapCard> _buildGridCards(int count) {
  List<SnapCard> cards = List.generate(
    count,
    (int index) {
      return const SnapCard();
    },
  );
  return cards;
}

class JournalPage extends StatelessWidget {
  const JournalPage({Key? key}) : super(key: key);

  static const String routeName = '/journal';

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1, // how many columns
      padding: const EdgeInsets.all(8.0), // padding around the grid
      childAspectRatio: 16.0 / 9.0, // width to height ratio
      children: _buildGridCards(20), // List of SnapCard widgets
    );
  }
}
