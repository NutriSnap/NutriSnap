import 'package:flutter/material.dart';

// class Challenges extends StatelessWidget {
//   final List<bool> completedDays;

//   const Challenges({super.key, required this.completedDays});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding:
//           const EdgeInsets.all(10), // Add some padding inside the container
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         //border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         crossAxisAlignment:
//             CrossAxisAlignment.start, // Align content to the start
//         children: [
//           const Text(
//             'Challenge: The 7 Day Mindful Eating Challenge',
//             style: TextStyle(
//               fontSize: 14, // Reduced the font size a bit
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 5), // Reduced the space for a tighter fit
//           Row(
//             mainAxisAlignment:
//                 MainAxisAlignment.spaceAround, // Evenly space the icons
//             children: List.generate(7, (index) {
//               return Icon(
//                 completedDays[index]
//                     ? Icons.check_box
//                     : Icons.check_box_outline_blank,
//                 //color: completedDays[index] ? Colors.green : Colors.grey[500],
//                 size: 20, // Adjust for your desired size
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

enum ChallengeType { oneTime, daily, sevenDay }

class Challenge {
  final String title;
  final String description;
  final String badgeImagePath;
  final ChallengeType type;
  List<bool> progress;

  Challenge(
      {required this.title,
      required this.description,
      required this.badgeImagePath,
      this.type = ChallengeType.oneTime,
      required this.progress});
}

class Challenges extends StatelessWidget {
  final List<Challenge> challengeList = [
    Challenge(
      title: 'First Snap',
      description: 'Upload the very first meal photo.',
      badgeImagePath: 'assets/badges/first_snap.png',
      type: ChallengeType.oneTime,
      progress: [false],
    ),
    Challenge(
      title: 'Unprocessed Champion',
      description:
          'Have a high percentage of unprocessed foods in meals over a week.',
      badgeImagePath: 'assets/badges/unprocessed.png',
      type: ChallengeType.sevenDay,
      progress: List.generate(7, (_) => false),
    ),
    Challenge(
      title: 'Ultra-Processed Avoider',
      description:
          'Have the lowest percentage of ultra-processed foods for 7 days in a row.',
      badgeImagePath: 'assets/badges/avoider.png',
      type: ChallengeType.sevenDay,
      progress: List.generate(7, (_) => false),
    ),
    // ... More challenges ...
    Challenge(
      title: 'Great Breakfast',
      description: 'Start your day with a healthy breakfast.',
      badgeImagePath: 'assets/badges/great_breakfast.png',
      type: ChallengeType.daily,
      progress: [true],
    ),
    Challenge(
      title: 'Home Cooking',
      description: 'Prepare your meals at home using fresh ingredients.',
      badgeImagePath: 'assets/badges/home_cooking.png',
      type: ChallengeType.daily,
      progress: [false],
    ),
    Challenge(
      title: 'Natural Yogurt Switch',
      description: 'Switch to natural yogurt, adding fresh fruits for flavor.',
      badgeImagePath: 'assets/badges/natural_yogurt_switch.png',
      type: ChallengeType.daily,
      progress: [false],
    ),
    Challenge(
      title: 'Nutty Snack Time',
      description: 'Choose nuts as a nutritious snack option.',
      badgeImagePath: 'assets/badges/nutty_snacks.png',
      type: ChallengeType.daily,
      progress: [false],
    ),
  ];

  Challenges({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: challengeList.length,
      itemBuilder: (context, index) {
        final challenge = challengeList[index];
        return Card(
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(challenge.badgeImagePath,
                    width: 40, height: 40),
                title: Text(challenge.title),
                subtitle: Text(challenge.description),
              ),
              _buildProgressRow(challenge),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgressRow(Challenge challenge) {
    if (challenge.type == ChallengeType.oneTime) {
      return Container(); // No progress row for one-time challenges
    }
    int days = challenge.type == ChallengeType.sevenDay
        ? 7
        : 1; // Adjust the number of days based on the challenge type
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(days, (dayIndex) {
        return Icon(
          challenge.progress[dayIndex]
              ? Icons.check_box
              : Icons.check_box_outline_blank,
          size: 20,
        );
      }),
    );
  }
}
