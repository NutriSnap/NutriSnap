import 'package:flutter/material.dart';
import 'package:nutrisnap/features/settings/presentation/widgets/dropdown_menu.dart';

const List<String> mindfulnessValues = <String>['On', 'Off'];
const List<String> mindfulnessTimes = <String>['Before/After Meals', 'Morning/Evening', 'Morning', 'Evening'];
const List<String> mindfulnessFocus = <String>['Fullness', 'Anxiety', 'Multitasking', 'Body Image'];

class Mindfulness extends StatelessWidget {
  const Mindfulness({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align content to the start
          children: [
            Text('Mindfulness',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Mindfulness check-ins: ',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                CustomDropdownMenu(values: mindfulnessValues),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Check-in times: ',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                CustomDropdownMenu(values: mindfulnessTimes),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('I want to check in on: ',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                CustomDropdownMenu(values: mindfulnessFocus),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
