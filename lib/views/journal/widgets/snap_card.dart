import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:nutrisnap/core/constants/app_colors.dart';
import 'package:nutrisnap/data_models/snap.dart';
import 'food_list.dart';

class SnapCard extends StatelessWidget {
  const SnapCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  DateFormat.yMMMd().format(snapDB.getSnap('2').date).toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8.0),
                ConstrainedBox(
                  constraints: const BoxConstraints.tightFor(width: 100.0),

                  child:
                    FoodList(),
                )
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: Image.asset((snapDB.getSnap('2').imageUrl),
            ),
          ),
        ],
      ),
    );
  }
}
