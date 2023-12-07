// import 'package:flutter/material.dart';
// import 'package:nutrisnap/features/challenges/widgets/challenges_card.dart';

// List<ChallengesCard> _buildGridCards(int count) {
//   List<ChallengesCard> cards = List.generate(
//     count,
//     (int index) {
//       return const ChallengesCard();
//     },
//   );
//   return cards;
// }

// class ChallengesPage extends StatelessWidget {
//   const ChallengesPage({Key? key}) : super(key: key);

//   static const String routeName = '/challenges';

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Theme.of(context).colorScheme.surface,
//       child: GridView.count(
//         crossAxisCount: 1,
//         padding: const EdgeInsets.all(2.0),
//         childAspectRatio: 16.0 / 9.0,
//         children: _buildGridCards(4),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:nutrisnap/features/dashboard/presentation/widgets/challenge_card.dart';
import 'package:nutrisnap/features/dashboard/presentation/widgets/challenges.dart'; // Assuming you have a Challenge model

// Define your challenges somewhere in your code. For example:
final List<Challenge> challengeList = [
  Challenge(
    title: 'First Snap',
    description: 'Upload the very first meal photo.',
    badgeImagePath: 'assets/badges/first_snap.png',
    type: ChallengeType.oneTime,
    progress: [true],
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
    progress: [false],
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

List<Widget> _buildGridCards(BuildContext context) {
  return challengeList.map((challenge) {
    return ChallengeCard(challenge: challenge);
  }).toList();
}

class ChallengesPage extends StatelessWidget {
  const ChallengesPage({Key? key}) : super(key: key);

  static const String routeName = '/challenges';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Challenges'),
      // ),
      body: GridView.count(
        crossAxisCount: 1, // If you want a single column, keep this as 1
        padding: const EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 2.65, // Adjust the aspect ratio as needed
        children: _buildGridCards(context), // Pass the BuildContext if needed
      ),
    );
  }
}


// ColorFiltered(
//   colorFilter: const ColorFilter.matrix([
//     0.2126, 0.7152, 0.0722, 0, 0,
//     0.2126, 0.7152, 0.0722, 0, 0,
//     0.2126, 0.7152, 0.0722, 0, 0,
//     0,      0,      0,      1, 0,
//   ]),
//   child: Image.asset('path/to/your/image.png'),
// )