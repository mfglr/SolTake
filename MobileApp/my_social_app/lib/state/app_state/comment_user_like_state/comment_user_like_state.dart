import 'package:flutter/material.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';

@immutable
class CommentUserLikeState extends BaseEntity<int>{
  final num commentId;
  final num userId;
  final DateTime createdAt;
  
  CommentUserLikeState({
    required super.id,
    required this.commentId,
    required this.userId,
    required this.createdAt
  });
}