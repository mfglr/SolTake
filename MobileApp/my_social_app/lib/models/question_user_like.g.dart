// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_user_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionUserLike _$QuestionUserLikeFromJson(Map<String, dynamic> json) =>
    QuestionUserLike(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      questionId: (json['questionId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      name: json['name'] as String?,
      userName: json['userName'] as String,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$QuestionUserLikeToJson(QuestionUserLike instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'questionId': instance.questionId,
      'userId': instance.userId,
      'name': instance.name,
      'userName': instance.userName,
      'image': instance.image,
    };
