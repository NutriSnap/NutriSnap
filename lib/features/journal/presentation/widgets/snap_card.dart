import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutrisnap/features/snaps/domain/snap.dart';
import '../../../all_data_provider.dart';
import '../../../ns_error.dart';
import '../../../ns_loading.dart';
import 'food_list.dart';
import 'line_processing_indicator.dart';

class SnapCard extends ConsumerWidget {
  const SnapCard({Key? key, required this.snap}) : super(key: key);

  final Snap snap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<AllData> asyncAllData = ref.watch(allDataProvider);
    return asyncAllData.when(
        data: (allData) => _build(
              context: context,
              snaps: allData.snaps,
              date: allData.date,
            ),
        loading: () => const NSLoading(),
        error: (error, st) => NSError(error.toString(), st.toString()));
  }

  Widget _build({
    required BuildContext context,
    required List<Snap> snaps,
    required DateTime date,
  }) {
    String imageUrl = snap.imageUrl;
    String calories = snap.calories.toString();
    Image image = Image.asset(imageUrl, fit: BoxFit.cover);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Two columns 1. Text 2. Image
        crossAxisAlignment:
            CrossAxisAlignment.start, // Aligns the text to the top
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snap.meal,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 150,
                    maxHeight: 100,
                  ),
                  child: FoodList(
                    snap: snap,
                  ), // This is a list that scrolls vertically and displays the food items
                ),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 50,
                    ),
                    child: LineProcessingIndicator(
                        unprocessed: snap.unprocessedPercentage,
                        processed: snap.moderatelyProcessedPercentage,
                        ultraprocessed: snap.highlyProcessedPercentage)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '$calories kcal',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ),
          SizedBox(
            child: AspectRatio(
              aspectRatio: 1,
              child: image,
            ), // This is the image, 150x150
          ),
        ],
      ),
    );
  }
}
