import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// @riverpod
class DateNotifier extends StateNotifier<DateTime> {
  DateNotifier() : super(DateTime.now());

  void setDate(date) {
    state = date;
  }
}

final dateProvider = StateNotifierProvider<DateNotifier, DateTime>(
      (ref) => DateNotifier(),
);
