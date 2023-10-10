
class Challenge {
  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.requirements,
  });

  String id;
  String title;
  String description;
  Map<String, bool> requirements;
}

class ChallengeDB {
  final List<Challenge> _challenges = [
    Challenge(
      id: '1',
      title: 'Challenge 1',
      description: 'Challenge 1 description',
      requirements: {'1': true, '2': false, '3': true},
    ),
    Challenge(
      id: '2',
      title: 'Challenge 2',
      description: 'Challenge 2 description',
      requirements: {'1': true, '2': true, '3': true},
    ),
    Challenge(
      id: '3',
      title: 'Challenge 3',
      description: 'Challenge 3 description',
      requirements: {'1': true, '2': false, '3': true},
    ),
  ];

  List<Challenge> get challenges {
    return [..._challenges];
  }

  Challenge getChallenge(String challengeId) {
    return _challenges.firstWhere((challenge) => challenge.id == challengeId);
  }
}

ChallengeDB challengeDB = ChallengeDB();