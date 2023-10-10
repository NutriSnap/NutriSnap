import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(10), // Add some padding inside the container
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align content to the start
        children: [
          Text('Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('App Notifications: ',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text('On',
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              )
            ],
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Snap Reminders: ',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text('Once daily',
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              )
            ],
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Reminder Time: ',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text('6 AM',
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
