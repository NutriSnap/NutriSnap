// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealDatabaseHash() => r'3ab022029a069a9abf507fc42ae7b8300526951d';

/// See also [mealDatabase].
@ProviderFor(mealDatabase)
final mealDatabaseProvider = AutoDisposeProvider<MealDatabase>.internal(
  mealDatabase,
  name: r'mealDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mealDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MealDatabaseRef = AutoDisposeProviderRef<MealDatabase>;
String _$mealsHash() => r'5290f7b534354ae8e84e8fce931a69143ec117a0';

/// See also [meals].
@ProviderFor(meals)
final mealsProvider = AutoDisposeStreamProvider<List<Meal>>.internal(
  meals,
  name: r'mealsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MealsRef = AutoDisposeStreamProviderRef<List<Meal>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter
