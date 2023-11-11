import 'package:flutter/material.dart';
import 'package:nutrisnap/features/challenges/widgets/checkbox.dart';

class ChallengesCard extends StatelessWidget {
  const ChallengesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Phase 1: The 7-day Snap!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8.0),
            const Center(
                child: Text(
              'Log your meals for seven days in a row to get a baseine measure of your food trends',
              textAlign: TextAlign.center,
            )),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('0/7'),
                  CustomCheckbox(),
                  CustomCheckbox(),
                  CustomCheckbox(),
                  CustomCheckbox(),
                  CustomCheckbox(),
                  CustomCheckbox(),
                  CustomCheckbox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
