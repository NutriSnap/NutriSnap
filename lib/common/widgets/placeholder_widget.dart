import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String textLabel;
  const PlaceholderWidget(this.color, this.textLabel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          textLabel,
          style: const TextStyle(fontSize: 36, color: Colors.white),
        ),
      ),
    );
  }
}
