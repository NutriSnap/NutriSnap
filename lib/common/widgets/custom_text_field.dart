import 'package:flutter/material.dart';
import 'package:nutrisnap/core/constants/pallete.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 325,
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: (25.0)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.brown.shade200,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Pallete.avocadoLightGreen,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: ThemeData().colorScheme.surface,
        ),
        autofocus: true,
        obscureText: hintText == 'Password' ? true : false,
        obscuringCharacter: '*',
        autocorrect: false,
      ),
    );
  }
}
