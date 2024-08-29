// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_user_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentUserLike _$CommentUserLikeFromJson(Map<String, dynamic> json) =>
    CommentUserLike(
      id: (json['id'] as num).toInt(),
      commentId: (json['commentId'] as num).toInt(),
      appUserId: (json['appUserId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      appUser: json['appUser'] == null
          ? null
          : User.fromJson(json['appUser'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUserLikeToJson(CommentUserLike instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commentId': instance.commentId,
      'appUserId': instance.appUserId,
      'createdAt': instance.createdAt.toIso8601String(),
      'appUser': instance.appUser,
    };
