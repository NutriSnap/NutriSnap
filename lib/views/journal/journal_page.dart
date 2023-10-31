import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/views/journal/widgets/snap_card.dart';
import 'package:nutrisnap/views/snaps/domain/snap.dart';
import 'package:nutrisnap/views/snaps/data/snap_providers.dart';

List<SnapCard> _buildGridCards(BuildContext context, WidgetRef ref) {
  final SnapDB snapDB = ref.watch(snapDBProvider);
  List<String> snapIds = snapDB.getSnapIds();

  if (snapIds.isEmpty) {
    return const <SnapCard>[];
  }

  return snapIds.map((snapId) {
    return SnapCard(snapId: snapId);
  }).toList();
}

class JournalPage extends ConsumerWidget {
  const JournalPage({Key? key}) : super(key: key);

  static const String routeName = '/journal';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: GridView.count(
        crossAxisCount: 1, // how many columns
        padding: const EdgeInsets.all(8.0), // padding around the grid
        childAspectRatio: 16.0 / 9.0, // width to height ratio
        children: _buildGridCards(context, ref), // List of SnapCard widgets
      ),
    );
  }
}
