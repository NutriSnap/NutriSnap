// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snap_food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SnapFoodItemImpl _$$SnapFoodItemImplFromJson(Map<String, dynamic> json) =>
    _$SnapFoodItemImpl(
      id: json['id'] as String,
      snapId: json['snapId'] as String,
      name: json['name'] as String,
      processedLevel: json['processedLevel'] as String,
      servings: json['servings'] as String,
      calories: json['calories'] as int,
    );

Map<String, dynamic> _$$SnapFoodItemImplToJson(_$SnapFoodItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'snapId': instance.snapId,
      'name': instance.name,
      'processedLevel': instance.processedLevel,
      'servings': instance.servings,
      'calories': instance.calories,
    };
