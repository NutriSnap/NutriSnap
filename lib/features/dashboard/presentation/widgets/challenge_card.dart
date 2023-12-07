import 'package:flutter/material.dart';
import 'challenges.dart'; // Import your Challenge model

class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  const ChallengeCard({Key? key, required this.challenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isCompleted =
        challenge.progress.every((isDayComplete) => isDayComplete);

    return Card(
      child: Column(
        children: [
          ListTile(
            leading: isCompleted
                ? Image.asset(challenge.badgeImagePath, width: 40, height: 40)
                : ColorFiltered(
                    colorFilter: const ColorFilter.matrix([
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0.2126,
                      0.7152,
                      0.0722,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ]),
                    child: Image.asset(challenge.badgeImagePath,
                        width: 40, height: 40),
                  ),
            title: Text(challenge.title,
                style: Theme.of(context).textTheme.headlineSmall),
            subtitle: Text(challenge.description),
          ),
          _buildProgressRow(challenge),
          const SizedBox(height: 8),
        ],
      ),
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

// ColorFiltered(
//   colorFilter: const ColorFilter.matrix([
//     0.2126, 0.7152, 0.0722, 0, 0,
//     0.2126, 0.7152, 0.0722, 0, 0,
//     0.2126, 0.7152, 0.0722, 0, 0,
//     0,      0,      0,      1, 0,
//   ]),