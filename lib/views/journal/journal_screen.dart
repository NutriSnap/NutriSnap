import 'package:flutter/material.dart';
import 'package:nutrisnap/core/constants/app_colors.dart';
import 'package:nutrisnap/views/journal/widgets/snap_card.dart';

List<SnapCard> _buildGridCards(int count) {
  List<SnapCard> cards = List.generate(
    count,
        (int index) {
      return SnapCard();
    },
  );
  return cards;
}

class JournalScreen extends StatelessWidget {
  const JournalScreen({Key? key}) : super(key: key);

  static const String routeName = '/journal';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal'),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 16.0 / 9.0,
        children: _buildGridCards(4),
      ),
    );
  }
}
