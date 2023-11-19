// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingImpl _$$SettingImplFromJson(Map<String, dynamic> json) =>
    _$SettingImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      theme: json['theme'] as String,
      notifications: json['notifications'] as bool,
      goals: json['goals'] as Map<String, dynamic>,
      mindfulnessReminders: (json['mindfulnessReminders'] as List<dynamic>)
          .map((e) => DateTime.parse(e as String))
          .toList(),
      appFeatures: (json['appFeatures'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      favoritePages: (json['favoritePages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$SettingImplToJson(_$SettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'theme': instance.theme,
      'notifications': instance.notifications,
      'goals': instance.goals,
      'mindfulnessReminders': instance.mindfulnessReminders
          .map((e) => e.toIso8601String())
          .toList(),
      'appFeatures': instance.appFeatures,
      'favoritePages': instance.favoritePages,
    };
