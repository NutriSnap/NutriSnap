import 'package:nutrisnap/features/profile/data/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'journal/data/date_provider.dart';
import 'profile/domain/profile.dart';
import 'snaps/data/image_provider.dart';
import 'snaps/domain/snap_image.dart';
import 'snaps/data/snap_provider.dart';
import 'snaps/domain/snap.dart';

part 'all_data_provider.g.dart';

// Based on: https://stackoverflow.com/questions/69929734/combining-futureproviders-using-a-futureprovider-riverpod

class AllData {
  AllData(
      {
        required this.snaps,
        required this.date,
        required this.profiles,
        required this.currentUserID
        });

  final List<Snap> snaps;
  final DateTime date;
  final List<Profile> profiles;
  final String currentUserID;
}

@riverpod
Future<AllData> allData(AllDataRef ref) async {
  final snaps = ref.watch(snapsProvider.future);
  final date = ref.watch(dateProvider);
  final profiles = ref.watch(profilesProvider.future);
  final currentUserID = ref.watch(currentUserIDProvider);
  return AllData(
      snaps: await snaps,
      date: date,
      profiles: await profiles,
      currentUserID: currentUserID
      );
}
