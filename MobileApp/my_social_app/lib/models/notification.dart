import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/notification_entity_state.dart/notification_state.dart';
part 'notification.g.dart';

@immutable
@JsonSerializable()
class Notification{
  final int id;
  final int ownerId;
  final DateTime createdAt;
  final bool isViewed;
  final int type;
  final int? parentId;
  final int? commentId;
  final String? content;
  final int? questionId;
  final int userId;
  final String userName;
  final int? solutionId;

  const Notification({
    required this.id,
    required this.ownerId,
    required this.createdAt,
    required this.isViewed,
    required this.type,
    required this.parentId,
    required this.commentId,
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
        content: content,
        questionId: questionId,
        userId: userId,
        userName: userName,
        solutionId: solutionId
      );
}