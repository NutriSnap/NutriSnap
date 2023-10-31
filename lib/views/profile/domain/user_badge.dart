import '../../challenges/domain/badge.dart';

class UserBadge {
  UserBadge({
    required this.id,
    required this.ownerId,
    required this.badgeId,
    required this.dateAchieved,
  });

  String id;
  String ownerId;
  String badgeId;
  DateTime dateAchieved;
}

class UserBadgeDB {
  final List<UserBadge> _userBadges = [
    UserBadge(
      id: '1',
      ownerId: '1',
      badgeId: '1',
      dateAchieved: DateTime.now(),
    ),
    UserBadge(
      id: '2',
      ownerId: '2',
      badgeId: '2',
      dateAchieved: DateTime.now(),
    ),
    UserBadge(
      id: '3',
      ownerId: '3',
      badgeId: '3',
      dateAchieved: DateTime.now(),
    ),
  ];

  UserBadge getUserBadge(String userBadgeId) {
    return _userBadges.firstWhere((userBadge) => userBadge.id == userBadgeId);
  }

  List<UserBadge> get userBadges {
    return [..._userBadges];
  }

  Badge getAssociatedBadge(String badgeId) {
    return badgeDB.getBadge(badgeId);
  }

  List<String> getUserBadgeIdsByUser(String userId) {
    return _userBadges.where((userBadge) => userBadge.ownerId == userId).map((userBadge) => userBadge.id).toList();
  }
}

UserBadgeDB userBadgeDB = UserBadgeDB();