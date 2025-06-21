// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectRequest _$SubjectRequestFromJson(Map<String, dynamic> json) =>
    SubjectRequest(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
      examId: (json['examId'] as num).toInt(),
      examName: json['examName'] as String,
      state: (json['state'] as num).toInt(),
      reason: (json['reason'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubjectRequestToJson(SubjectRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
      'examId': instance.examId,
      'examName': instance.examName,
      'state': instance.state,
      'reason': instance.reason,
    };
