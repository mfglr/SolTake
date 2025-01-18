// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_user_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentUserLike _$CommentUserLikeFromJson(Map<String, dynamic> json) =>
    CommentUserLike(
      id: (json['id'] as num).toInt(),
      commentId: (json['commentId'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUserLikeToJson(CommentUserLike instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commentId': instance.commentId,
      'userId': instance.userId,
      'createdAt': instance.createdAt.toIso8601String(),
      'user': instance.user,
    };
