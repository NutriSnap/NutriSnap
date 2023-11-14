// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snap_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snapDatabaseHash() => r'57dc015da4d64e5fbdac466766e8f17390fd9071';

/// See also [snapDatabase].
@ProviderFor(snapDatabase)
final snapDatabaseProvider = AutoDisposeProvider<SnapDatabase>.internal(
  snapDatabase,
  name: r'snapDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$snapDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SnapDatabaseRef = AutoDisposeProviderRef<SnapDatabase>;
String _$snapsHash() => r'4199822ab24b53375a1bf3f6e4bbeee83c969fbd';

/// See also [snaps].
@ProviderFor(snaps)
final snapsProvider = AutoDisposeStreamProvider<List<Snap>>.internal(
  snaps,
  name: r'snapsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$snapsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SnapsRef = AutoDisposeStreamProviderRef<List<Snap>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
