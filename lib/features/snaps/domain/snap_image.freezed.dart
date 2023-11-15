// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'snap_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SnapImage _$SnapImageFromJson(Map<String, dynamic> json) {
  return _SnapImage.fromJson(json);
}

/// @nodoc
mixin _$SnapImage {
  String get id => throw _privateConstructorUsedError;
  String get path =>
      throw _privateConstructorUsedError; //required String labelId,
  String get snapId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnapImageCopyWith<SnapImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnapImageCopyWith<$Res> {
  factory $SnapImageCopyWith(SnapImage value, $Res Function(SnapImage) then) =
      _$SnapImageCopyWithImpl<$Res, SnapImage>;
  @useResult
  $Res call({String id, String path, String snapId});
}

/// @nodoc
class _$SnapImageCopyWithImpl<$Res, $Val extends SnapImage>
    implements $SnapImageCopyWith<$Res> {
  _$SnapImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? snapId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      snapId: null == snapId
          ? _value.snapId
          : snapId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SnapImageImplCopyWith<$Res>
    implements $SnapImageCopyWith<$Res> {
  factory _$$SnapImageImplCopyWith(
          _$SnapImageImpl value, $Res Function(_$SnapImageImpl) then) =
      __$$SnapImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String path, String snapId});
}

/// @nodoc
class __$$SnapImageImplCopyWithImpl<$Res>
    extends _$SnapImageCopyWithImpl<$Res, _$SnapImageImpl>
    implements _$$SnapImageImplCopyWith<$Res> {
  __$$SnapImageImplCopyWithImpl(
      _$SnapImageImpl _value, $Res Function(_$SnapImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? path = null,
    Object? snapId = null,
  }) {
    return _then(_$SnapImageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      snapId: null == snapId
          ? _value.snapId
          : snapId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SnapImageImpl implements _SnapImage {
  const _$SnapImageImpl(
      {required this.id, required this.path, required this.snapId});

  factory _$SnapImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SnapImageImplFromJson(json);

  @override
  final String id;
  @override
  final String path;
//required String labelId,
  @override
  final String snapId;

  @override
  String toString() {
    return 'SnapImage(id: $id, path: $path, snapId: $snapId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SnapImageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.snapId, snapId) || other.snapId == snapId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, path, snapId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SnapImageImplCopyWith<_$SnapImageImpl> get copyWith =>
      __$$SnapImageImplCopyWithImpl<_$SnapImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SnapImageImplToJson(
      this,
    );
  }
}

abstract class _SnapImage implements SnapImage {
  const factory _SnapImage(
      {required final String id,
      required final String path,
      required final String snapId}) = _$SnapImageImpl;

  factory _SnapImage.fromJson(Map<String, dynamic> json) =
      _$SnapImageImpl.fromJson;

  @override
  String get id;
  @override
  String get path;
  @override //required String labelId,
  String get snapId;
  @override
  @JsonKey(ignore: true)
  _$$SnapImageImplCopyWith<_$SnapImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
