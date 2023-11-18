// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SnapImpl _$$SnapImplFromJson(Map<String, dynamic> json) => _$SnapImpl(
      owner: json['owner'] as String,
      title: json['title'] as String,
      meal: json['meal'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      calories: json['calories'] as int,
      unprocessedPercentage: (json['unprocessedPercentage'] as num).toDouble(),
      moderatelyProcessedPercentage:
          (json['moderatelyProcessedPercentage'] as num).toDouble(),
      highlyProcessedPercentage:
          (json['highlyProcessedPercentage'] as num).toDouble(),
      foodsList: (json['foodsList'] as List<dynamic>)
          .map((e) => SnapFoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SnapImplToJson(_$SnapImpl instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'title': instance.title,
      'meal': instance.meal,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'dateTime': instance.dateTime.toIso8601String(),
      'calories': instance.calories,
      'unprocessedPercentage': instance.unprocessedPercentage,
      'moderatelyProcessedPercentage': instance.moderatelyProcessedPercentage,
      'highlyProcessedPercentage': instance.highlyProcessedPercentage,
      'foodsList': instance.foodsList,
    };
