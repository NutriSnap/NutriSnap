import 'profile.dart';

/// Encapsulates operations on the list of [Profile] returned from Firestore.
class ProfileCollection {
  ProfileCollection(profiles) : _profiles = profiles;

  final List<Profile> _profiles;

  int size() {
    return _profiles.length;
  }

  Profile getProfile(String profileID) {
    return _profiles.firstWhere((profileData) => profileData.id == profileID);
  }
}