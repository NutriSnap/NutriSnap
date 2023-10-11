import 'package:flutter/material.dart';
import 'package:nutrisnap/views/journal/widgets/snap_card.dart';

import 'package:nutrisnap/data_models/snap.dart';
import 'package:nutrisnap/data_models/snap_food_item.dart';

List<SnapCard> _buildGridCards(BuildContext context) {
  List<String> snapIds = snapDB.getSnapIds();

  if (snapIds.isEmpty) {
    return const <SnapCard>[];
  }

  return snapIds.map((snapId) {
  return SnapCard(snapId: snapId);
  }).toList();

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
      children: _buildGridCards(context), // List of SnapCard widgets
    );
  }
}
