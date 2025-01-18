import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';

@immutable
class NotificationState{
  final int id;
  final int ownerId;
  final int appUserId;
  final String userName;
  final DateTime createdAt;
  final bool isViewed;
  final int type;
  final int? parentId;
  final int? repliedId;
  final int? commentId;
  final String? commentContent;
  final int? questionId;
  final int? solutionId;
  final Multimedia? image;

  const NotificationState({
    required this.id,
    required this.ownerId,
    required this.createdAt,
    required this.isViewed,
    required this.type,
    required this.parentId,
    required this.commentId,
    required this.repliedId,
    required this.questionId,
    required this.appUserId,
    required this.userName,
    required this.commentContent,
    required this.solutionId,
    required this.image
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
        questionId: questionId,
        appUserId: appUserId,
        userName: userName,
        commentContent: commentContent,
        solutionId: solutionId,
        image: image
      );
}