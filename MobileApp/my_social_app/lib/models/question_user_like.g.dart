// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_user_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionUserLike _$QuestionUserLikeFromJson(Map<String, dynamic> json) =>
    QuestionUserLike(
      id: (json['id'] as num).toInt(),
      questionId: (json['questionId'] as num).toInt(),
      appUserId: (json['appUserId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      appUser: json['appUser'] == null
          ? null
          : User.fromJson(json['appUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionUserLikeToJson(QuestionUserLike instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionId': instance.questionId,
      'appUserId': instance.appUserId,
      'createdAt': instance.createdAt.toIso8601String(),
      'appUser': instance.appUser,
    };
