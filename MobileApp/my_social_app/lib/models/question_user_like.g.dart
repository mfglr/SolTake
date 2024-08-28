// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_user_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionUserLike _$QuestionUserLikeFromJson(Map<String, dynamic> json) =>
    QuestionUserLike(
      id: (json['id'] as num).toInt(),
      appUserId: (json['appUserId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$QuestionUserLikeToJson(QuestionUserLike instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appUserId': instance.appUserId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
