import 'package:flutter/material.dart';

/// Build a SnackBar that can be accessed anywhere in the system.
class GlobalSnackBar {
  static GlobalKey<ScaffoldMessengerState> key =
      GlobalKey<ScaffoldMessengerState>();

  static void show(String message) {
    key.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
