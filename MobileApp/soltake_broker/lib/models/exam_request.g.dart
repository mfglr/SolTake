// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamRequest _$ExamRequestFromJson(Map<String, dynamic> json) => ExamRequest(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  name: json['name'] as String,
  initialism: json['initialism'] as String,
  state: (json['state'] as num).toInt(),
  reason: (json['reason'] as num?)?.toInt(),
);

Map<String, dynamic> _$ExamRequestToJson(ExamRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'initialism': instance.initialism,
      'state': instance.state,
      'reason': instance.reason,
    };
