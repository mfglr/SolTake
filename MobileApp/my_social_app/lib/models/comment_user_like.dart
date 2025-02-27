import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/models/user.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_state.dart';
import 'package:my_social_app/state/entity_state/base_entity.dart';
part 'comment_user_like.g.dart';

@immutable
@JsonSerializable()
class CommentUserLike extends BaseEntity<num>{
  final int commentId;
  final int userId;
  final DateTime createdAt;
  final User? user;
  
  CommentUserLike({
    required super.id,
    required this.commentId,
    required this.userId,
    required this.createdAt,
    required this.user
  });


  factory CommentUserLike.fromJson(Map<String, dynamic> json) => _$CommentUserLikeFromJson(json);
  Map<String, dynamic> toJson() => _$CommentUserLikeToJson(this);

  CommentUserLikeState toCommentUserLikeState()
    => CommentUserLikeState(
        id: id,
        userId: userId,
        commentId: commentId,
        createdAt: createdAt,
      );

}