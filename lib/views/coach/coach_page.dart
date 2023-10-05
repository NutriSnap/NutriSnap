import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/placeholder_widget.dart';

class CoachPage extends StatelessWidget {
  const CoachPage({Key? key}) : super(key: key);
  static const routeName = '/coach';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Coach');
  }
}
