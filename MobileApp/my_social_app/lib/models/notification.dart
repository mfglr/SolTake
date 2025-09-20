import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/custom_packages/media/models/multimedia.dart';
import 'package:my_social_app/state/notifications_state.dart/notification_state.dart';
part 'notification.g.dart';

@immutable
@JsonSerializable()
class Notification{
  final int id;
  final DateTime createdAt;
  final int ownerId;
  final bool isViewed;
  final int type;
  final int userId;
  final String userName;
  final Multimedia? image;
  
  final int? questionId;
  final String? questionContent;
  final Multimedia? questionMedia;
  
  final int? commentId;
  final String? commentContent;

  final int? solutionId;
  final String? solutionContent;
  final Multimedia? solutionMedia;

  final int? repliedId;
  final String? repliedContent;

  final int? solutionVoteType;

  const Notification({
    required this.id,
    required this.ownerId,
    required this.createdAt,
    required this.isViewed,
    required this.type,
    required this.userId,
    required this.userName,
    required this.image,

    required this.questionId,
    required this.questionContent,
    required this.questionMedia,

    required this.commentId,
    required this.commentContent,

    required this.solutionId,
    required this.solutionContent,
    required this.solutionMedia,

    required this.repliedId,
    required this.repliedContent,

    required this.solutionVoteType
  });

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  NotificationState toNotificationState()
    => NotificationState(
        id: id,
        ownerId: ownerId,
        createdAt: createdAt,
        isViewed: isViewed,
        userName: userName,
        type: type,
        userId: userId,
        image: image,

        questionId: questionId,
        questionContent: questionContent,
        questionMedia: questionMedia,

        commentId: commentId,
        commentContent: commentContent,

        solutionId: solutionId,
        solutionContent: solutionContent,
        solutionMedia: solutionMedia,

        repliedId: repliedId,
        repliedContent: repliedContent,

        solutionVoteType: solutionVoteType
      );
}