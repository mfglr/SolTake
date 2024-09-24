// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_user_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolutionUserSave _$SolutionUserSaveFromJson(Map<String, dynamic> json) =>
    SolutionUserSave(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      solutionId: (json['solutionId'] as num).toInt(),
      appUserId: (json['appUserId'] as num).toInt(),
      solution: json['solution'] == null
          ? null
          : Solution.fromJson(json['solution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SolutionUserSaveToJson(SolutionUserSave instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'solutionId': instance.solutionId,
      'appUserId': instance.appUserId,
      'solution': instance.solution,
    };
