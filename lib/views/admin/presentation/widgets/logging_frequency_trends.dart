import 'package:flutter/material.dart';

class LoggingFrequencyTrends extends StatelessWidget {
  const LoggingFrequencyTrends({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Logging Frequency Trends',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              )
          ),
          SizedBox(height: 8),
          Text('Chart Here!'),
        ],
      ),
    );
  }
}
