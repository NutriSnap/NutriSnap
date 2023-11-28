// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileDatabaseHash() => r'bf3cbea9ee038d0b1acda28a961ce919db052e5b';

/// See also [profileDatabase].
@ProviderFor(profileDatabase)
final profileDatabaseProvider = AutoDisposeProvider<ProfileDatabase>.internal(
  profileDatabase,
  name: r'profileDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileDatabaseRef = AutoDisposeProviderRef<ProfileDatabase>;
String _$profilesHash() => r'76eb5eb012e25f5bec6aade2bd4329c45b332756';

/// See also [profiles].
@ProviderFor(profiles)
final profilesProvider = AutoDisposeStreamProvider<List<Profile>>.internal(
  profiles,
  name: r'profilesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$profilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfilesRef = AutoDisposeStreamProviderRef<List<Profile>>;
String _$currentUserIDHash() => r'fcc1b736638289871b82e61abfd9a5984bede617';

/// See also [currentUserID].
@ProviderFor(currentUserID)
final currentUserIDProvider = AutoDisposeProvider<String>.internal(
  currentUserID,
  name: r'currentUserIDProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserIDHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserIDRef = AutoDisposeProviderRef<String>;
String _$currentUserHash() => r'df977552e228aa614e5f1ba325dd0b22a113a13e';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeFutureProvider<User>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeFutureProviderRef<User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
