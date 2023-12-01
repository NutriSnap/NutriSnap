import 'package:flutter/material.dart';

import 'field_padding.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onSubmit});

  final void Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FieldPadding(
        child: ElevatedButton(
          onPressed: onSubmit,
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
