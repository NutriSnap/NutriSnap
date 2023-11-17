import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/features/profile/domain/user_data.dart';

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});