// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$imageDatabaseHash() => r'7eda8880e66d334d8045211f4853cb47f708e73c';

/// See also [imageDatabase].
@ProviderFor(imageDatabase)
final imageDatabaseProvider = AutoDisposeProvider<ImageDatabase>.internal(
  imageDatabase,
  name: r'imageDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$imageDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImageDatabaseRef = AutoDisposeProviderRef<ImageDatabase>;
String _$imagesHash() => r'f2e12bbaf83e7384946916c25fe0c3a4fe6fcc7a';

/// See also [images].
@ProviderFor(images)
final imagesProvider = AutoDisposeStreamProvider<List<Image>>.internal(
  images,
  name: r'imagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$imagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ImagesRef = AutoDisposeStreamProviderRef<List<Image>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
