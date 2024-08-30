import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/entity.dart';

@immutable
class CommentUserLikeState extends Entity{
  final DateTime createdAt;
  final int commentId;
  final int appUserId;
  
  const CommentUserLikeState({
    required super.id,
    required this.createdAt,
    required this.commentId,
    required this.appUserId,
  });
}