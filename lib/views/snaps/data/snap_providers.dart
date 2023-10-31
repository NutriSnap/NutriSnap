import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/views/snaps/domain/snap.dart';

final snapDBProvider = Provider<SnapDB>((ref) {
  return SnapDB(ref);
});