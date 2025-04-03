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
      userId: (json['userId'] as num).toInt(),
      userName: json['userName'] as String,
      image: json['image'] == null
          ? null
          : Multimedia.fromJson(json['image'] as Map<String, dynamic>),
      questionId: (json['questionId'] as num?)?.toInt(),
      questionContent: json['questionContent'] as String?,
      questionMedia: json['questionMedia'] == null
          ? null
          : Multimedia.fromJson(json['questionMedia'] as Map<String, dynamic>),
      commentId: (json['commentId'] as num?)?.toInt(),
      commentContent: json['commentContent'] as String?,
      solutionId: (json['solutionId'] as num?)?.toInt(),
      solutionContent: json['solutionContent'] as String?,
      solutionMedia: json['solutionMedia'] == null
          ? null
          : Multimedia.fromJson(json['solutionMedia'] as Map<String, dynamic>),
      repliedId: (json['repliedId'] as num?)?.toInt(),
      repliedContent: json['repliedContent'] as String?,
      solutionVoteType: (json['solutionVoteType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'ownerId': instance.ownerId,
      'isViewed': instance.isViewed,
      'type': instance.type,
      'userId': instance.userId,
      'userName': instance.userName,
      'image': instance.image,
      'questionId': instance.questionId,
      'questionContent': instance.questionContent,
      'questionMedia': instance.questionMedia,
      'commentId': instance.commentId,
      'commentContent': instance.commentContent,
      'solutionId': instance.solutionId,
      'solutionContent': instance.solutionContent,
      'solutionMedia': instance.solutionMedia,
      'repliedId': instance.repliedId,
      'repliedContent': instance.repliedContent,
      'solutionVoteType': instance.solutionVoteType,
    };
