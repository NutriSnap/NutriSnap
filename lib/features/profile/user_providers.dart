import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/features/profile/domain/user_db.dart';

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});