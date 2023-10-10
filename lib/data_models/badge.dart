class Badge {
  Badge({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  String id;
  String name;
  String description;
  String imageUrl;
}

class BadgeDB {
  final List<Badge> _badges = [
    Badge(
      id: '1',
      name: 'Badge 1',
      description: 'Badge 1 description',
      imageUrl: 'assets/images/badge1.png',
    ),
    Badge(
      id: '2',
      name: 'Badge 2',
      description: 'Badge 2 description',
      imageUrl: 'assets/images/badge2.png',
    ),
    Badge(
      id: '3',
      name: 'Badge 3',
      description: 'Badge 3 description',
      imageUrl: 'assets/images/badge3.png',
    ),
  ];

  Badge getBadge(String badgeId) {
    return _badges.firstWhere((badge) => badge.id == badgeId);
  }

  List<Badge> get badges {
    return [..._badges];
  }

}

BadgeDB badgeDB = BadgeDB();