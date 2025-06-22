// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_user_complaint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionUserComplaint _$QuestionUserComplaintFromJson(
  Map<String, dynamic> json,
) => QuestionUserComplaint(
  id: (json['id'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  reason: (json['reason'] as num).toInt(),
  content: json['content'] as String?,
  medias: (json['medias'] as List<dynamic>).map(
    (e) => Multimedia.fromJson(e as Map<String, dynamic>),
  ),
  questionContent: json['questionContent'] as String?,
);

Map<String, dynamic> _$QuestionUserComplaintToJson(
  QuestionUserComplaint instance,
) => <String, dynamic>{
  'id': instance.id,
  'createdAt': instance.createdAt.toIso8601String(),
  'reason': instance.reason,
  'content': instance.content,
  'medias': instance.medias.toList(),
  'questionContent': instance.questionContent,
};
