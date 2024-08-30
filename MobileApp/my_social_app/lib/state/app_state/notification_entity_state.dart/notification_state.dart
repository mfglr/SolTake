import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class NotificationState extends Entity{
  final DateTime createdAt;
  final int ownerId;
  final bool isViewed;
  final int type;
  final int? parentId;
  final int? repliedId;
  final int? commentId;
  final int? questionId;
  final int userId;
  final int? solutionId;

  const NotificationState({
    required super.id,
    required this.createdAt,
    required this.ownerId,
    required this.isViewed,
    required this.type,
    required this.parentId,
    required this.commentId,
    required this.repliedId,
    required this.questionId,
    required this.userId,
    required this.solutionId,
  });

  NotificationState markAsViewed()
    => NotificationState(
        id: id,
        createdAt: createdAt,
        ownerId: ownerId,
        isViewed: true,
        type: type,
        parentId: parentId,
        commentId: commentId,
        repliedId: repliedId,
        questionId: questionId,
        userId: userId,
        solutionId: solutionId,
      );
}