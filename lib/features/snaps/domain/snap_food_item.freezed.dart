// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snap_food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SnapFoodItem _$SnapFoodItemFromJson(Map<String, dynamic> json) {
  return _SnapFoodItem.fromJson(json);
}

/// @nodoc
mixin _$SnapFoodItem {
  String get id => throw _privateConstructorUsedError;
  String get snapId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get processedLevel => throw _privateConstructorUsedError;
  String get servings => throw _privateConstructorUsedError;
  int get calories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnapFoodItemCopyWith<SnapFoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapFoodItemCopyWith<$Res> {
  factory $SnapFoodItemCopyWith(
          SnapFoodItem value, $Res Function(SnapFoodItem) then) =
      _$SnapFoodItemCopyWithImpl<$Res, SnapFoodItem>;
  @useResult
  $Res call(
      {String id,
      String snapId,
      String name,
      String processedLevel,
      String servings,
      int calories});
}

/// @nodoc
class _$SnapFoodItemCopyWithImpl<$Res, $Val extends SnapFoodItem>
    implements $SnapFoodItemCopyWith<$Res> {
  _$SnapFoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? snapId = null,
    Object? name = null,
    Object? processedLevel = null,
    Object? servings = null,
    Object? calories = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      snapId: null == snapId
          ? _value.snapId
          : snapId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      processedLevel: null == processedLevel
          ? _value.processedLevel
          : processedLevel // ignore: cast_nullable_to_non_nullable
              as String,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnapFoodItemImplCopyWith<$Res>
    implements $SnapFoodItemCopyWith<$Res> {
  factory _$$SnapFoodItemImplCopyWith(
          _$SnapFoodItemImpl value, $Res Function(_$SnapFoodItemImpl) then) =
      __$$SnapFoodItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String snapId,
      String name,
      String processedLevel,
      String servings,
      int calories});
}

/// @nodoc
class __$$SnapFoodItemImplCopyWithImpl<$Res>
    extends _$SnapFoodItemCopyWithImpl<$Res, _$SnapFoodItemImpl>
    implements _$$SnapFoodItemImplCopyWith<$Res> {
  __$$SnapFoodItemImplCopyWithImpl(
      _$SnapFoodItemImpl _value, $Res Function(_$SnapFoodItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? snapId = null,
    Object? name = null,
    Object? processedLevel = null,
    Object? servings = null,
    Object? calories = null,
  }) {
    return _then(_$SnapFoodItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      snapId: null == snapId
          ? _value.snapId
          : snapId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      processedLevel: null == processedLevel
          ? _value.processedLevel
          : processedLevel // ignore: cast_nullable_to_non_nullable
              as String,
      servings: null == servings
          ? _value.servings
          : servings // ignore: cast_nullable_to_non_nullable
              as String,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SnapFoodItemImpl implements _SnapFoodItem {
  const _$SnapFoodItemImpl(
      {required this.id,
      required this.snapId,
      required this.name,
      required this.processedLevel,
      required this.servings,
      required this.calories});

  factory _$SnapFoodItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SnapFoodItemImplFromJson(json);

  @override
  final String id;
  @override
  final String snapId;
  @override
  final String name;
  @override
  final String processedLevel;
  @override
  final String servings;
  @override
  final int calories;

  @override
  String toString() {
    return 'SnapFoodItem(id: $id, snapId: $snapId, name: $name, processedLevel: $processedLevel, servings: $servings, calories: $calories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnapFoodItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.snapId, snapId) || other.snapId == snapId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.processedLevel, processedLevel) ||
                other.processedLevel == processedLevel) &&
            (identical(other.servings, servings) ||
                other.servings == servings) &&
            (identical(other.calories, calories) ||
                other.calories == calories));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, snapId, name, processedLevel, servings, calories);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnapFoodItemImplCopyWith<_$SnapFoodItemImpl> get copyWith =>
      __$$SnapFoodItemImplCopyWithImpl<_$SnapFoodItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SnapFoodItemImplToJson(
      this,
    );
  }
}

abstract class _SnapFoodItem implements SnapFoodItem {
  const factory _SnapFoodItem(
      {required final String id,
      required final String snapId,
      required final String name,
      required final String processedLevel,
      required final String servings,
      required final int calories}) = _$SnapFoodItemImpl;

  factory _SnapFoodItem.fromJson(Map<String, dynamic> json) =
      _$SnapFoodItemImpl.fromJson;

  @override
  String get id;
  @override
  String get snapId;
  @override
  String get name;
  @override
  String get processedLevel;
  @override
  String get servings;
  @override
  int get calories;
  @override
  @JsonKey(ignore: true)
  _$$SnapFoodItemImplCopyWith<_$SnapFoodItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
