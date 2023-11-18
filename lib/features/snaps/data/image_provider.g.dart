// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snapImageDatabaseHash() => r'a3123ffd6008e0fe353277ff94def5c2f0669c85';

/// See also [snapImageDatabase].
@ProviderFor(snapImageDatabase)
final snapImageDatabaseProvider =
    AutoDisposeProvider<SnapImageDatabase>.internal(
  snapImageDatabase,
  name: r'snapImageDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$snapImageDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SnapImageDatabaseRef = AutoDisposeProviderRef<SnapImageDatabase>;
String _$snapImagesHash() => r'480324ff3913b0c65e16f675c51f94edf1af0b75';

/// See also [snapImages].
@ProviderFor(snapImages)
final snapImagesProvider = AutoDisposeStreamProvider<List<SnapImage>>.internal(
  snapImages,
  name: r'snapImagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$snapImagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SnapImagesRef = AutoDisposeStreamProviderRef<List<SnapImage>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
