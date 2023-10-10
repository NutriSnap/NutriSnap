import 'package:flutter/material.dart';

class Mindfulness extends StatelessWidget {
  const Mindfulness({super.key});

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
          Text('Mindfulness',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Mindfulness check-ins: ',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text('On',
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Check-in times: ',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text('before / after each meal',
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('I want to check in on: ',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text('hunger / fullness levels',
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
