// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) => Notification(
      id: (json['id'] as num).toInt(),
      ownerId: (json['ownerId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      isViewed: json['isViewed'] as bool,
      type: (json['type'] as num).toInt(),
      parentId: (json['parentId'] as num?)?.toInt(),
      commentId: (json['commentId'] as num?)?.toInt(),
      repliedId: (json['repliedId'] as num?)?.toInt(),
      commentContent: json['commentContent'] as String?,
      questionId: (json['questionId'] as num?)?.toInt(),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      solutionId: (json['solutionId'] as num?)?.toInt(),
      solutionContent: json['solutionContent'] as String?,
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'ownerId': instance.ownerId,
      'userId': instance.userId,
      'isViewed': instance.isViewed,
      'type': instance.type,
      'parentId': instance.parentId,
      'repliedId': instance.repliedId,
      'commentId': instance.commentId,
      'solutionId': instance.solutionId,
      'questionId': instance.questionId,
      'commentContent': instance.commentContent,
      'userName': instance.userName,
      'solutionContent': instance.solutionContent,
    };
