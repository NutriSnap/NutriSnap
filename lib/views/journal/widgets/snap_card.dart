import 'package:flutter/material.dart';
// import 'package:nutrisnap/core/constants/app_colors.dart';

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
                  'Title',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8.0),
                const Text('Food 1'),
                const Text('Food 2'),
                const Text('Food 3'),
              ],
            ),
          ),
          const AspectRatio(
            aspectRatio: 1.0 / 1.0,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
