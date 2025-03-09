// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'solution_user_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SolutionUserSave _$SolutionUserSaveFromJson(Map<String, dynamic> json) =>
    SolutionUserSave(
      id: (json['id'] as num).toInt(),
      solution: Solution.fromJson(json['solution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SolutionUserSaveToJson(SolutionUserSave instance) =>
    <String, dynamic>{
      'id': instance.id,
      'solution': instance.solution,
    };
