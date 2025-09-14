import 'package:flutter/material.dart';
import 'package:my_social_app/packages/media/models/multimedia.dart';
import 'package:my_social_app/state/avatar.dart';
import 'package:my_social_app/packages/entity_state/entity.dart';

@immutable
class NotificationState extends Entity<int> implements Avatar{
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


  @override
  int get avatarId => userId;

  @override
  Multimedia? get avatar => image;

  NotificationState({
    required super.id,
    required this.createdAt,
    required this.ownerId,
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

  NotificationState markAsViewed()
    => NotificationState(
        id: id,
        ownerId: ownerId,
        createdAt: createdAt,
        isViewed: true,
        type: type,
        userId: userId,
        userName: userName,
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