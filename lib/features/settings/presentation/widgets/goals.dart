import 'package:flutter/material.dart';

class Goals extends StatelessWidget {
  const Goals({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.all(10), // Add some padding inside the container
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Align content to the start
        children: [
          Text('Goals',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('My Goal: ', style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text('Increase Unprocessed Food',
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              )
            ],
          ),
          SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Target Percentage: ',
                  textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
              Expanded(
                child: Text('Beginner (30)',
                    textAlign: TextAlign.right, style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
