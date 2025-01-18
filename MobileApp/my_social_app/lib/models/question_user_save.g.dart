// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_user_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionUserSave _$QuestionUserSaveFromJson(Map<String, dynamic> json) =>
    QuestionUserSave(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      questionId: (json['questionId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      question: json['question'] == null
          ? null
          : Question.fromJson(json['question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionUserSaveToJson(QuestionUserSave instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'questionId': instance.questionId,
      'userId': instance.userId,
      'question': instance.question,
    };
