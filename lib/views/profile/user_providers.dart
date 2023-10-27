import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:nutrisnap/data_models/user_db.dart';

final userDBProvider = Provider<UserDB>((ref) {
  return UserDB(ref);
});