// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_user_save.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionUserSave _$QuestionUserSaveFromJson(Map<String, dynamic> json) =>
    QuestionUserSave(
      id: (json['id'] as num).toInt(),
      question: Question.fromJson(json['question'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionUserSaveToJson(QuestionUserSave instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
    };
