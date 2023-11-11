import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndexNotifier extends StateNotifier<int> {
  PageIndexNotifier() : super(0);

  void setPageIndex(int index) {
    state = index;
  }
}

final pageIndexProvider = StateNotifierProvider<PageIndexNotifier, int>(
  (ref) => PageIndexNotifier(),
);
