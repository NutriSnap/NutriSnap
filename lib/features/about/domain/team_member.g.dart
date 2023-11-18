// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TeamMemberImpl _$$TeamMemberImplFromJson(Map<String, dynamic> json) =>
    _$TeamMemberImpl(
      name: json['name'] as String,
      role: json['role'] as String,
      githubUrl: json['githubUrl'] as String,
      linkedinUrl: json['linkedinUrl'] as String,
    );

Map<String, dynamic> _$$TeamMemberImplToJson(_$TeamMemberImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'role': instance.role,
      'githubUrl': instance.githubUrl,
      'linkedinUrl': instance.linkedinUrl,
    };
