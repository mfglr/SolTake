import 'package:flutter/material.dart';
import 'package:my_social_app/state/user_item.dart';

@immutable
class CommentUserLikeState extends UserItem{
  CommentUserLikeState({
    required super.id,
    required super.userName,
    required super.name,
    required super.userId,
    required super.image
  });
}