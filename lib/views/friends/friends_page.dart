import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/placeholder_widget.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);
  static const routeName = '/friends';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Friends');
  }
}
