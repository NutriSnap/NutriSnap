import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/snap.dart';

final snapDBProvider = Provider<SnapDB>((ref) {
  return SnapDB(ref);
});