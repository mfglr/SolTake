import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/models/avatar.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class NotificationState extends BaseEntity<num> implements Avatar{
  final int ownerId;
  final int userId;
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

  @override
  int get avatarId => userId;

  @override
  Multimedia? get avatar => image;

  NotificationState({
    required super.id,
    required this.ownerId,
    required this.createdAt,
    required this.isViewed,
    required this.type,
    required this.parentId,
    required this.commentId,
    required this.repliedId,
    required this.questionId,
    required this.userId,
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
        userId: userId,
        userName: userName,
        commentContent: commentContent,
        solutionId: solutionId,
        image: image
      );
}