import 'user.dart';
import 'challenge_template.dart';

class ChallengeProgress {
  ChallengeProgress({
    required this.id,
    required this.challengeId,
    required this.ownerId,
    required this.startDate,
    this.endDate,
    required this.requirements,
  });

  String id;
  String challengeId;
  String ownerId;
  DateTime startDate;
  DateTime? endDate;
  Map<String, bool> requirements;
}

class ChallengeProgressDB {
  final List<ChallengeProgress> _challengeProgresses = [
    ChallengeProgress(
      id: '1',
      challengeId: '1',
      ownerId: '1',
      startDate: DateTime.now(),
      requirements: {'1': true, '2': false, '3': true},
    ),
    ChallengeProgress(
      id: '2',
      challengeId: '2',
      ownerId: '2',
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      requirements: {'1': true, '2': true, '3': true},
    ),
    ChallengeProgress(
      id: '3',
      challengeId: '3',
      ownerId: '3',
      startDate: DateTime.now(),
      requirements: {'1': true, '2': false, '3': true},
    ),
  ];

  List<ChallengeProgress> get challengeProgresses {
    return [..._challengeProgresses];
  }

  ChallengeProgress getChallengeProgress(String challengeProgressId) {
    return _challengeProgresses.firstWhere((challengeProgress) => challengeProgress.id == challengeProgressId);
  }

  List<ChallengeProgress> getChallengeProgressesByUser(String userId) {
    return _challengeProgresses.where((challengeProgress) => challengeProgress.ownerId == userId).toList();
  }
}

ChallengeProgressDB challengeProgressDB = ChallengeProgressDB();