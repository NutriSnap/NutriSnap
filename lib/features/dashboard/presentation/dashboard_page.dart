import 'package:flutter/material.dart';

import '../../../common/widgets/fab.dart';
import 'widgets/food_processing_indicator.dart';
import 'widgets/challenges.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  static const String routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const FAB(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,

        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 2),
                // Food Processing Indicator
                Card(
                  color: Theme.of(context).colorScheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  borderOnForeground: false,
                  child: const Column(
                    children: [
                      // Your text above the FoodProcessingIndicator
                      Text(
                        "Today's Breakdown",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2.0),
                      // Food Processing Indicator
                      FoodProcessingIndicator(
                        unprocessed: 0.5,
                        processed: 0.3,
                        ultraprocessed: 0.2,
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                // Placeholder for Weekly Progress

                Card(
                  color: Theme.of(context).colorScheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  borderOnForeground: false,
                  child: const Challenges(
                    completedDays: [
                      true,
                      false,
                      true,
                      false,
                      true,
                      true,
                      false
                    ], // Example data
                  ),
                ),

                const SizedBox(height: 8),
                // Box with 3 text items
                Card(
                  color: Theme.of(context).colorScheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  borderOnForeground: false,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Mindfulness Stats',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('Avg hunger before meal: 7 / 10',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 4),
                        Text('Avg fullness after meal: 80% full',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Card(
                    color: Theme.of(context).colorScheme.surface,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    borderOnForeground: false,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        ListTile(
                          leading: Icon(Icons.star),
                          title: Text('Achievement 1'),
                          subtitle: Text('Description of achievement 1'),
                        ),
                        ListTile(
                          leading: Icon(Icons.star),
                          title: Text('Achievement 2'),
                          subtitle: Text('Description of achievement 2'),
                        ),
                        ListTile(
                          leading: Icon(Icons.star),
                          title: Text('Achievement 3'),
                          subtitle: Text('Description of achievement 3'),
                        ),
                      ],
                    )),
                const SizedBox(height: 8),
                // Placeholder for Acheivements
              ],
            ),
          ),
        ),
      ),
    );
  }
}
