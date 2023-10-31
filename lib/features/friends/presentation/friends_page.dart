import 'package:flutter/material.dart';

class User {
  final String username;
  final String profilePictureUrl;
  final String byline;
  int likesCount;

  User({
    required this.username,
    required this.profilePictureUrl,
    required this.byline,
    this.likesCount = 0,
  });

  String get initials => username.substring(0, 2).toUpperCase();
}

final List<User> mockUsers = [
  User(
      username: 'Alice',
      profilePictureUrl: 'assets/images/people/alice.png',
      byline: 'Loves fitness and health'),
  User(
      username: 'Bob',
      profilePictureUrl: 'assets/images/people/bob.jpg',
      byline: 'Passionate about nutrition'),
  User(
      username: 'Maya',
      profilePictureUrl: 'assets/images/people/maya.png',
      byline: 'Health and Wellness Coach at doTERRA International LLC'),
  // Add more mock users...
];

class UserCard extends StatefulWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  UserCardState createState() => UserCardState();
}

class UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ensuring 16:9 aspect ratio for the profile image
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 6,
                child: Image.asset(
                  widget.user.profilePictureUrl,
                  fit: BoxFit
                      .cover, // This will ensure the image covers the space without distortion
                ),
              ),
            ),
            Row(
              children: [
                CircleAvatar(
                  child: Text(widget.user.initials),
                ),
                const SizedBox(width: 8),
                Text(widget.user.username),
              ],
            ),
            Text(widget.user.byline),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.user.likesCount++;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: widget.user.likesCount > 0
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                    Text('${widget.user.likesCount}'),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    // TODO: Button action
                  },
                  child: const Text('Connect'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FriendsPage extends StatelessWidget {
  const FriendsPage({super.key});

  static const routeName = '/friends';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: mockUsers.length,
        itemBuilder: (context, index) {
          final user = mockUsers[index];
          return UserCard(user: user);
        },
      ),
    );
  }
}
