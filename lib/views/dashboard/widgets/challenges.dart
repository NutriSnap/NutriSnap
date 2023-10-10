import 'package:flutter/material.dart';

class Challenges extends StatelessWidget {
  final List<bool> completedDays;

  const Challenges({super.key, required this.completedDays});

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
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align content to the start
        children: [
          const Text(
            'Challenge: The 7 Day Mindful Eating Challenge',
            style: TextStyle(
              fontSize: 14, // Reduced the font size a bit
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5), // Reduced the space for a tighter fit
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround, // Evenly space the icons
            children: List.generate(7, (index) {
              return Icon(
                completedDays[index]
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: completedDays[index] ? Colors.green : Colors.grey[500],
                size: 20, // Adjust for your desired size
              );
            }),
          ),
        ],
      ),
    );
  }
}
