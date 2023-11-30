import 'package:flutter/material.dart';
import 'package:nutrisnap/features/settings/presentation/widgets/dropdown_menu.dart';

const List<String> notificationValues = <String>['On', 'Off'];
const List<String> reminderNum = <String>['Once daily', 'Twice Daily', 'Three times daily'];
const List<String> reminderTime = <String>['4 am', '5 am', '6 am', '7 am', '8 am', '9 am', '10 am', '11 am', '12 pm', '1 pm', '2 pm', '3 pm', '4 pm', '5 pm', '6 pm', '7 pm'];

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.center, // Align content to the start
          children: [
            Text('Notifications',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('App Notifications: ',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                CustomDropdownMenu(values: notificationValues),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Snap Reminders: ',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                CustomDropdownMenu(values: reminderNum),
              ],
            ),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Reminder Time: ',
                    textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
                CustomDropdownMenu(values: reminderTime),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
