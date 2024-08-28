// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_user_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentUserLike _$CommentUserLikeFromJson(Map<String, dynamic> json) =>
    CommentUserLike(
      id: (json['id'] as num).toInt(),
      appUserId: (json['appUserId'] as num).toInt(),
    );

Map<String, dynamic> _$CommentUserLikeToJson(CommentUserLike instance) =>
    <String, dynamic>{
      'id': instance.id,
      'appUserId': instance.appUserId,
    };
