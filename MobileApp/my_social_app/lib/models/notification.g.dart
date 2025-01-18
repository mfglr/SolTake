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
      commentContent: json['commentContent'] as String?,
      repliedId: (json['repliedId'] as num?)?.toInt(),
      questionId: (json['questionId'] as num?)?.toInt(),
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      solutionId: (json['solutionId'] as num?)?.toInt(),
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'ownerId': instance.ownerId,
      'userId': instance.userId,
      'userName': instance.userName,
      'isViewed': instance.isViewed,
      'type': instance.type,
      'parentId': instance.parentId,
      'repliedId': instance.repliedId,
      'commentId': instance.commentId,
      'commentContent': instance.commentContent,
      'solutionId': instance.solutionId,
      'questionId': instance.questionId,
      'image': instance.image,
    };
