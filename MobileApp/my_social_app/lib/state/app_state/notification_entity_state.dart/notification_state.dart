import 'package:flutter/material.dart';

@immutable
class NotificationState{
  final int id;
  final int ownerId;
  final DateTime createdAt;
  final bool isViewed;
  final int type;
  final int? parentId;
  final int? repliedId;
  final int? commentId;
  final String? commentContent;
  final int? questionId;
  final int userId;
  final String userName;
  final int? solutionId;
  final String? solutionContent;

  const NotificationState({
    required this.id,
    required this.ownerId,
    required this.createdAt,
    required this.isViewed,
    required this.type,
    required this.parentId,
    required this.commentId,
    required this.repliedId,
    required this.commentContent,
    required this.questionId,
    required this.userId,
    required this.userName,
    required this.solutionId,
    required this.solutionContent
  });

  NotificationState markAsViewed()
    => NotificationState(
        id: id,
        ownerId: ownerId,
        createdAt: createdAt,
        isViewed: true,
        type: type,
        parentId: parentId,
        commentId: commentId,
        repliedId: repliedId,
        commentContent: commentContent,
        questionId: questionId,
        userId: userId,
        userName: userName,
        solutionId: solutionId,
        solutionContent: solutionContent,
      );
}