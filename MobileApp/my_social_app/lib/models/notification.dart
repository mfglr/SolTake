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
  final int? parentType;
  final int? parentId;
  final int? commentId;
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
    required this.parentType,
    required this.parentId,
    required this.commentId,
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
        parentType: parentType,
        parentId: parentId,
        commentId: commentId,
        questionId: questionId,
        userId: userId,
        userName: userName,
        solutionId: solutionId
      );
}