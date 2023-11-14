// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SnapImpl _$$SnapImplFromJson(Map<String, dynamic> json) => _$SnapImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      mealId: json['mealId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      date: DateTime.parse(json['date'] as String),
      calories: json['calories'] as int,
      unprocessedPercentage: (json['unprocessedPercentage'] as num).toDouble(),
      moderatelyProcessedPercentage:
          (json['moderatelyProcessedPercentage'] as num).toDouble(),
      highlyProcessedPercentage:
          (json['highlyProcessedPercentage'] as num).toDouble(),
      foodsList:
          (json['foodsList'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SnapImplToJson(_$SnapImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'mealId': instance.mealId,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'date': instance.date.toIso8601String(),
      'calories': instance.calories,
      'unprocessedPercentage': instance.unprocessedPercentage,
      'moderatelyProcessedPercentage': instance.moderatelyProcessedPercentage,
      'highlyProcessedPercentage': instance.highlyProcessedPercentage,
      'foodsList': instance.foodsList,
    };
