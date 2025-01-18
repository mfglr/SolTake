// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_user_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionUserLike _$QuestionUserLikeFromJson(Map<String, dynamic> json) =>
    QuestionUserLike(
      id: (json['id'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionUserLikeToJson(QuestionUserLike instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionId': instance.questionId,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'user': instance.user,
    };
