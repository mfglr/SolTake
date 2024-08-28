import 'package:flutter/material.dart';
import 'package:my_social_app/state/pagination/has_pagination_property.dart';

@immutable
class CommentUserLikeState extends HasPaginationProperty<num>{
  final int id;
  final int commentId;
  final int appUserId;
  final DateTime createdAt;
  
  const CommentUserLikeState({
    required super.key,
    required this.userId,
    required this.createdAt
  });
}