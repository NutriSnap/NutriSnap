import 'package:flutter/material.dart';
import 'package:nutrisnap/features/settings/presentation/widgets/dropdown_menu.dart';

const List<String> goalValues = <String>[
  'Select Goal',
  'More Unprocessed Food',
  'Less Ultraprocessed Food',
];

const List<String> goalPercentages = <String>[
  'Select Target %',
  '10%', '20%', '30%', '40%', '50%', '60%', '70%', '80%', '90%'];

class Goals extends StatelessWidget {
  const Goals({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align content to the start
          children: [
            Text('Goals',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Goal: ',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                CustomDropdownMenu(values: goalValues),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Target %: ',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                CustomDropdownMenu(values: goalPercentages),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
