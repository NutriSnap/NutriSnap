import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/journal/presentation/widgets/date_picker.dart';

import 'package:nutrisnap/features/journal/presentation/widgets/snap_card.dart';
import 'package:nutrisnap/features/snaps/domain/snap.dart';
import 'package:nutrisnap/features/snaps/data/snap_provider.dart';
import 'package:intl/intl.dart';
import '../data/date_provider.dart';

List<SnapCard> _buildGridCards(BuildContext context, WidgetRef ref) {
  final SnapDB snapDB = ref.watch(snapDBProvider);
  final DateTime selectedDate = ref.watch(dateProvider);
  List<String> snapIds = snapDB.getSnapIds();

  // Filter snapIds based on the selected date
  List<String> filteredSnapIds = snapIds.where((snapId) {
    Snap snap = snapDB.getSnap(snapId);
    DateTime snapDate = snap.date;
    return DateFormat.yMMMd().format(snapDate) == DateFormat.yMMMd().format(selectedDate);
  }).toList();

  // Check if filtered list is empty
  if (filteredSnapIds.isEmpty) {
    return const <SnapCard>[];
  }

  // Map filtered snapIds to SnapCards
  return filteredSnapIds.map((snapId) => SnapCard(snapId: snapId)).toList();
}


class JournalPage extends ConsumerWidget {
  const JournalPage({Key? key}) : super(key: key);

  static const String routeName = '/journal';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: const DatePicker(),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: GridView.count(
          //shrinkWrap: true,
          crossAxisCount: 1, // how many columns
          padding: const EdgeInsets.all(8.0), // padding around the grid
          childAspectRatio: 16.0 / 9.0, // width to height ratio
          children: _buildGridCards(context, ref), // List of SnapCard widgets
        ),
      ),
    );
  }
}