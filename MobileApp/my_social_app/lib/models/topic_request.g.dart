// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicRequest _$TopicRequestFromJson(Map<String, dynamic> json) => TopicRequest(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      subjectName: json['subjectName'] as String,
      name: json['name'] as String,
      state: (json['state'] as num).toInt(),
      reason: (json['reason'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TopicRequestToJson(TopicRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'subjectName': instance.subjectName,
      'name': instance.name,
      'state': instance.state,
      'reason': instance.reason,
    };
