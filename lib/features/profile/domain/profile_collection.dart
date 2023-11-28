import 'profile.dart';

class ProfileCollection {
  ProfileCollection(profiles): _profiles = profiles;

  final List<Profile> _profiles;

  List<Profile> get profiles => _profiles;

  List<Profile> getProfileByUserId(String id) {
    return _profiles
        .where((profile) => profile.id == id)
        .toList();
  }

  List<Profile> getProfiles() {
    return _profiles.toList();
  }
}
