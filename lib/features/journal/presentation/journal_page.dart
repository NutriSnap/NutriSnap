import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/journal/presentation/widgets/date_picker.dart';

import 'package:nutrisnap/features/journal/presentation/widgets/snap_card.dart';
import 'package:nutrisnap/features/snaps/domain/snap.dart';
import 'package:nutrisnap/features/snaps/data/snap_provider.dart';
import 'package:intl/intl.dart';
import '../../all_data_provider.dart';
import '../../ns_error.dart';
import '../../ns_loading.dart';
import '../../snaps/domain/meal.dart';
import '../../snaps/domain/snap_collection.dart';
import '../../snaps/domain/snap_food_item.dart';
import '../../snaps/domain/snap_image.dart';
import '../data/date_provider.dart';

List<SnapCard> _buildGridCards(BuildContext context, DateTime selectedDate, List<Snap> snaps) {

  // Filter snaps based on the selected date
  List<Snap> filteredSnaps = snaps.where((snap) {
    DateTime snapDate = snap.date;
    return DateFormat.yMMMd().format(snapDate) == DateFormat.yMMMd().format(selectedDate);
  }).toList();

  // Check if filtered list is empty
  if (filteredSnaps.isEmpty) {
    return const <SnapCard>[];
  }

  // Map filtered snaps to SnapCards
  return filteredSnaps.map((snap) => SnapCard(snapId: snap.id)).toList();
}



class JournalPage extends ConsumerWidget {
  const JournalPage({Key? key}) : super(key: key);

  static const String routeName = '/journal';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
            context: context,
            snapFoodItems: allData.snapFoodItems,
            snaps: allData.snaps,
            meals: allData.meals,
            snapImages: allData.snapImages,
            date: allData.date,
            ),
        loading: () => const NSLoading(),
        error: (error, st) => NSError(error.toString(), st.toString()));
  }

  Widget _build(
      {required BuildContext context,
      required List<SnapFoodItem> snapFoodItems,
      required List<Snap> snaps,
      required List<Meal> meals,
      required List<SnapImage> snapImages,
      required DateTime date,}) {
    SnapCollection snapCollection = SnapCollection(snaps);
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
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
          children: _buildGridCards(context, date, snaps), // List of SnapCard widgets
        ),
      ),
    );
  }
}