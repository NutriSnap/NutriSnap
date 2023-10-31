import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
// import 'package:nutrisnap/core/constants/app_colors.dart';
import 'package:nutrisnap/features/snaps/domain/snap.dart';
import 'package:nutrisnap/features/snaps/data/snap_providers.dart';
import 'food_list.dart';

class SnapCard extends ConsumerWidget {
  const SnapCard({Key? key, required this.snapId}) : super(key: key);

  final String snapId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SnapDB snapDB = ref.watch(snapDBProvider);
    Snap snap = snapDB.getSnap(snapId);
    String imageUrl = snap.imageUrl;
    Image image = Image.asset(imageUrl, fit: BoxFit.cover);
    String date = DateFormat.yMMMd().format(snap.date).toString();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(
            24.0), // Padding around the card to space it evenly
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Two columns 1. Text 2. Image
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns the text to the top
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  date,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 100,
                    maxHeight: 100,
                  ),
                  child: FoodList(
                    snapId: snapId,
                  ), // This is a list that scrolls vertically and displays the food items
                ),
              ],
            ),
            // ),
            SizedBox(
              width: 150,
              height: 150,
              child: image, // This is the image, 150x150
            ),
          ],
        ),
      ),
    );
  }
}


            // child: Image.asset(snapDB.getSnap('2').imageUrl, fit: BoxFit.cover),
