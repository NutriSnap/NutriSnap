// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Setting _$SettingFromJson(Map<String, dynamic> json) {
  return _Setting.fromJson(json);
}

/// @nodoc
mixin _$Setting {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get theme => throw _privateConstructorUsedError;
  bool get notifications => throw _privateConstructorUsedError;
  Map<String, dynamic> get goals => throw _privateConstructorUsedError;
  List<DateTime> get mindfulnessReminders => throw _privateConstructorUsedError;
  List<String> get appFeatures => throw _privateConstructorUsedError;
  List<String> get favoritePages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingCopyWith<Setting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingCopyWith<$Res> {
  factory $SettingCopyWith(Setting value, $Res Function(Setting) then) =
      _$SettingCopyWithImpl<$Res, Setting>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String theme,
      bool notifications,
      Map<String, dynamic> goals,
      List<DateTime> mindfulnessReminders,
      List<String> appFeatures,
      List<String> favoritePages});
}

/// @nodoc
class _$SettingCopyWithImpl<$Res, $Val extends Setting>
    implements $SettingCopyWith<$Res> {
  _$SettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? theme = null,
    Object? notifications = null,
    Object? goals = null,
    Object? mindfulnessReminders = null,
    Object? appFeatures = null,
    Object? favoritePages = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as bool,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      mindfulnessReminders: null == mindfulnessReminders
          ? _value.mindfulnessReminders
          : mindfulnessReminders // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      appFeatures: null == appFeatures
          ? _value.appFeatures
          : appFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePages: null == favoritePages
          ? _value.favoritePages
          : favoritePages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingImplCopyWith<$Res> implements $SettingCopyWith<$Res> {
  factory _$$SettingImplCopyWith(
          _$SettingImpl value, $Res Function(_$SettingImpl) then) =
      __$$SettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String theme,
      bool notifications,
      Map<String, dynamic> goals,
      List<DateTime> mindfulnessReminders,
      List<String> appFeatures,
      List<String> favoritePages});
}

/// @nodoc
class __$$SettingImplCopyWithImpl<$Res>
    extends _$SettingCopyWithImpl<$Res, _$SettingImpl>
    implements _$$SettingImplCopyWith<$Res> {
  __$$SettingImplCopyWithImpl(
      _$SettingImpl _value, $Res Function(_$SettingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? theme = null,
    Object? notifications = null,
    Object? goals = null,
    Object? mindfulnessReminders = null,
    Object? appFeatures = null,
    Object? favoritePages = null,
  }) {
    return _then(_$SettingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      theme: null == theme
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as bool,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      mindfulnessReminders: null == mindfulnessReminders
          ? _value._mindfulnessReminders
          : mindfulnessReminders // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      appFeatures: null == appFeatures
          ? _value._appFeatures
          : appFeatures // ignore: cast_nullable_to_non_nullable
              as List<String>,
      favoritePages: null == favoritePages
          ? _value._favoritePages
          : favoritePages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettingImpl implements _Setting {
  const _$SettingImpl(
      {required this.id,
      required this.userId,
      required this.theme,
      required this.notifications,
      required final Map<String, dynamic> goals,
      required final List<DateTime> mindfulnessReminders,
      required final List<String> appFeatures,
      required final List<String> favoritePages})
      : _goals = goals,
        _mindfulnessReminders = mindfulnessReminders,
        _appFeatures = appFeatures,
        _favoritePages = favoritePages;

  factory _$SettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String theme;
  @override
  final bool notifications;
  final Map<String, dynamic> _goals;
  @override
  Map<String, dynamic> get goals {
    if (_goals is EqualUnmodifiableMapView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_goals);
  }

  final List<DateTime> _mindfulnessReminders;
  @override
  List<DateTime> get mindfulnessReminders {
    if (_mindfulnessReminders is EqualUnmodifiableListView)
      return _mindfulnessReminders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mindfulnessReminders);
  }

  final List<String> _appFeatures;
  @override
  List<String> get appFeatures {
    if (_appFeatures is EqualUnmodifiableListView) return _appFeatures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appFeatures);
  }

  final List<String> _favoritePages;
  @override
  List<String> get favoritePages {
    if (_favoritePages is EqualUnmodifiableListView) return _favoritePages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritePages);
  }

  @override
  String toString() {
    return 'Setting(id: $id, userId: $userId, theme: $theme, notifications: $notifications, goals: $goals, mindfulnessReminders: $mindfulnessReminders, appFeatures: $appFeatures, favoritePages: $favoritePages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.theme, theme) || other.theme == theme) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            const DeepCollectionEquality().equals(other._goals, _goals) &&
            const DeepCollectionEquality()
                .equals(other._mindfulnessReminders, _mindfulnessReminders) &&
            const DeepCollectionEquality()
                .equals(other._appFeatures, _appFeatures) &&
            const DeepCollectionEquality()
                .equals(other._favoritePages, _favoritePages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      theme,
      notifications,
      const DeepCollectionEquality().hash(_goals),
      const DeepCollectionEquality().hash(_mindfulnessReminders),
      const DeepCollectionEquality().hash(_appFeatures),
      const DeepCollectionEquality().hash(_favoritePages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingImplCopyWith<_$SettingImpl> get copyWith =>
      __$$SettingImplCopyWithImpl<_$SettingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingImplToJson(
      this,
    );
  }
}

abstract class _Setting implements Setting {
  const factory _Setting(
      {required final String id,
      required final String userId,
      required final String theme,
      required final bool notifications,
      required final Map<String, dynamic> goals,
      required final List<DateTime> mindfulnessReminders,
      required final List<String> appFeatures,
      required final List<String> favoritePages}) = _$SettingImpl;

  factory _Setting.fromJson(Map<String, dynamic> json) = _$SettingImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get theme;
  @override
  bool get notifications;
  @override
  Map<String, dynamic> get goals;
  @override
  List<DateTime> get mindfulnessReminders;
  @override
  List<String> get appFeatures;
  @override
  List<String> get favoritePages;
  @override
  @JsonKey(ignore: true)
  _$$SettingImplCopyWith<_$SettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
