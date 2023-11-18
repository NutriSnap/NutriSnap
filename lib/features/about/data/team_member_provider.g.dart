// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_member_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$teamMemberDatabaseHash() =>
    r'ffda144da01e21fad7939f42b7a7a5d949505329';

/// See also [teamMemberDatabase].
@ProviderFor(teamMemberDatabase)
final teamMemberDatabaseProvider =
    AutoDisposeProvider<TeamMemberDatabase>.internal(
  teamMemberDatabase,
  name: r'teamMemberDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$teamMemberDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TeamMemberDatabaseRef = AutoDisposeProviderRef<TeamMemberDatabase>;
String _$teamMembersHash() => r'0c04d45ca55b29699f6ef9d9d151632190a160c5';

/// See also [teamMembers].
@ProviderFor(teamMembers)
final teamMembersProvider =
    AutoDisposeStreamProvider<List<TeamMember>>.internal(
  teamMembers,
  name: r'teamMembersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$teamMembersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TeamMembersRef = AutoDisposeStreamProviderRef<List<TeamMember>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
