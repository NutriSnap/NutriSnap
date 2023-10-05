import 'package:flutter/material.dart';
import 'package:nutrisnap/common/widgets/placeholder_widget.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});
  static const routeName = '404';

  @override
  Widget build(BuildContext context) {
    return const PlaceholderWidget(Color(0xFF3F51B5), 'Page Not Found!');
  }
}
