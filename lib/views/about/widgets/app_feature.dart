import 'package:flutter/material.dart';

class AppFeature extends StatelessWidget {
  const AppFeature({
    Key? key,
    required this.featureText,
  }) : super(key: key);

  final String featureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        "• $featureText",
        style: Theme.of(context).textTheme.bodyLarge,
        //const TextStyle(fontSize: 16),
      ),
    );
  }
}