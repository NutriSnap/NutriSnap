import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier() : super(false);

  void toggle() {
    state = !state;
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
      (ref) => DarkModeNotifier(),
);