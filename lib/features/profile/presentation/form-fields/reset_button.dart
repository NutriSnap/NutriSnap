import 'package:flutter/material.dart';

import 'field_padding.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({super.key, required this.onReset});

  final void Function() onReset;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FieldPadding(
        child: OutlinedButton(
          onPressed: onReset,
          child: Text('Reset',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
        ),
      ),
    );
  }
}
