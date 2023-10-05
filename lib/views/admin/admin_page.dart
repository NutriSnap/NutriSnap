import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/placeholder_widget.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({Key? key}) : super(key: key);
  static const routeName = '/admin';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Admin');
  }
}
