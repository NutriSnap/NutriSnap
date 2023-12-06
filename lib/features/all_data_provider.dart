import 'package:nutrisnap/features/profile/data/profile_provider.dart';
import 'package:nutrisnap/features/profile/data/user_providers.dart';
import 'package:nutrisnap/features/profile/domain/profile.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'journal/data/date_provider.dart';
// import 'snaps/data/image_provider.dart';
// import 'snaps/domain/snap_image.dart';
import 'snaps/data/snap_provider.dart';
import 'snaps/domain/snap.dart';
import 'profile/domain/user.dart';

part 'all_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class AllData {
  AllData({
    required this.snaps,
    //required this.users,
    required this.date,
    required this.profiles,
    required this.currentUserID});

  final List<Snap> snaps;
  //final List<User> users;
  final List<Profile> profiles;
  final DateTime date;
  final String currentUserID;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final snaps = ref.watch(snapsProvider.future);
  //final users = ref.watch(usersProvider.future);
  final profiles = ref.watch(profilesProvider.future);
  final date = ref.watch(dateProvider);
  final currentUserID = ref.watch(currentUserIDProvider);
  return AllData(
      snaps: await snaps,
      //users: await users,
      profiles: await profiles,
      date: date,
      currentUserID: currentUserID);
}
