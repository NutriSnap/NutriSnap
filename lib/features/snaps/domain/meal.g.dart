// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealImpl _$$MealImplFromJson(Map<String, dynamic> json) => _$MealImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      name: json['name'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      unprocessedPercentage: (json['unprocessedPercentage'] as num).toDouble(),
      moderatelyProcessedPercentage:
          (json['moderatelyProcessedPercentage'] as num).toDouble(),
      highlyProcessedPercentage:
          (json['highlyProcessedPercentage'] as num).toDouble(),
      snapsList:
          (json['snapsList'] as List<dynamic>).map((e) => e as String).toList(),
      calories: json['calories'] as int,
    );

Map<String, dynamic> _$$MealImplToJson(_$MealImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'name': instance.name,
      'dateTime': instance.dateTime.toIso8601String(),
      'unprocessedPercentage': instance.unprocessedPercentage,
      'moderatelyProcessedPercentage': instance.moderatelyProcessedPercentage,
      'highlyProcessedPercentage': instance.highlyProcessedPercentage,
      'snapsList': instance.snapsList,
      'calories': instance.calories,
    };
