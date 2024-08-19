// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: (json['id'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      userName: json['userName'] as String,
      appUserId: (json['appUserId'] as num).toInt(),
      isEdited: json['isEdited'] as bool,
      content: json['content'] as String,
      isLiked: json['isLiked'] as bool,
      numberOfLikes: (json['numberOfLikes'] as num).toInt(),
      numberOfReplies: (json['numberOfReplies'] as num).toInt(),
      questionId: (json['questionId'] as num?)?.toInt(),
      solutionId: (json['solutionId'] as num?)?.toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      isOwner: json['isOwner'] as bool,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'userName': instance.userName,
      'appUserId': instance.appUserId,
      'isEdited': instance.isEdited,
      'content': instance.content,
      'isLiked': instance.isLiked,
      'numberOfLikes': instance.numberOfLikes,
      'numberOfReplies': instance.numberOfReplies,
      'questionId': instance.questionId,
      'solutionId': instance.solutionId,
      'parentId': instance.parentId,
      'isOwner': instance.isOwner,
    };
