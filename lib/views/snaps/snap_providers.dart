import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/data_models/snap.dart';

final snapDBProvider = Provider<SnapDB>((ref) {
  return SnapDB(ref);
});