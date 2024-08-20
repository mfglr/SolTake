import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
part 'notification.g.dart';

@immutable
@JsonSerializable()
class Notification{
  final int id;
  final DateTime createdAt;
  final int ownerId;
  final int userId;
  final bool isViewed;
  final int type;
  final int? parentId;
  final int? repliedId;
  final int? commentId;
  final int? solutionId;
  final int? questionId;
  final String? content;
  final String userName;

  const Notification({
    required this.id,
    required this.ownerId,
    required this.createdAt,
    required this.isViewed,
    required this.type,
    required this.parentId,
    required this.commentId,
    required this.repliedId,
    required this.content,
    required this.questionId,
    required this.userId,
    required this.userName,
    required this.solutionId,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  NotificationState toNotificationState()
    => NotificationState(
        id: id,
        ownerId: ownerId,
        createdAt: createdAt,
        isViewed: isViewed,
        type: type,
        parentId: parentId,
        commentId: commentId,
        repliedId: repliedId,
        content: content,
        questionId: questionId,
        userId: userId,
        userName: userName,
        solutionId: solutionId
      );
}