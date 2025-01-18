import 'package:flutter/material.dart';

@immutable
class CommentUserLikeState{
  final int id;
  final int commentId;
  final int userId;
  final DateTime createdAt;
  
  const CommentUserLikeState({
    required this.id,
    required this.commentId,
    required this.userId,
    required this.createdAt
  });
}