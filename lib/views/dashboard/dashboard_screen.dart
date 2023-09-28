import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/custom_app_bar.dart';
import 'widgets/food_processing_indicator.dart';
import 'widgets/challenges.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic for the floating action button
        },
        child: const Icon(Icons.camera_alt),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            // Begin and end points can be adjusted to control the gradient's direction
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.yellow,
              // Colors.green, // Start color (top)
              // Colors.yellow, // Middle color
              Colors.white // End color (bottom)
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Title
                const Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 2),
                // Food Processing Indicator
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
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

                const Challenges(
                  completedDays: [
                    true,
                    false,
                    true,
                    false,
                    true,
                    true,
                    false
                  ], // Example data
                ),

                const SizedBox(height: 8),
                // Box with 3 text items
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Column(
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
                const SizedBox(height: 8),
                Card(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    borderOnForeground: false,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        ListTile(
                          leading: Icon(Icons.star),
                          title: Text('Acheivement 1'),
                          subtitle: Text('Description of acheivement 1'),
                        ),
                        ListTile(
                          leading: Icon(Icons.star),
                          title: Text('Acheivement 2'),
                          subtitle: Text('Description of acheivement 2'),
                        ),
                        ListTile(
                          leading: Icon(Icons.star),
                          title: Text('Acheivement 3'),
                          subtitle: Text('Description of acheivement 3'),
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
