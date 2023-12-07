import 'package:flutter/material.dart';
import 'package:nutrisnap/features/dashboard/presentation/widgets/challenge_card.dart';

import '../../../common/widgets/fab.dart';
import 'widgets/food_processing_indicator.dart';
import 'widgets/challenges.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  static const String routeName = '/dashboard';

  final Challenge ongoingChallenge = Challenge(
    title: '7-day Snap',
    description: 'Snap your meals daily for a week.',
    badgeImagePath: 'assets/badges/seven_day_snap.png',
    type: ChallengeType.sevenDay,
    progress: [
      true,
      false,
      true,
      false,
      false,
      false,
      false
    ], // Example progress data
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

                ChallengeCard(challenge: ongoingChallenge),

                const SizedBox(height: 8),
                // Box with 3 text items
                Card(
                  color: Theme.of(context).colorScheme.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  borderOnForeground: false,
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
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
                      children: [
                        ListTile(
                          leading: Image.asset('assets/badges/first_snap.png',
                              width: 40, height: 40),
                          title: const Text('First Snap'),
                          subtitle:
                              const Text('Upload the very first meal photo'),
                        ),
                        ListTile(
                          leading: Image.asset('assets/badges/unprocessed.png',
                              width: 40, height: 40),
                          title: const Text('Unprocessed Champion'),
                          subtitle: const Text(
                              'Have a high percentage of unprocessed foods in meals over a week'),
                        ),
                        ListTile(
                          leading: Image.asset('assets/badges/avoider.png',
                              width: 40, height: 40),
                          title: const Text('Ultra-Processed Avoider'),
                          subtitle: const Text(
                              'Have the lowest percentage of ultra-processed foods for 7 days in a row'),
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
