import 'package:flutter/material.dart';

class MyBadges extends StatelessWidget {
  const MyBadges({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface,
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
        ));
  }
}
