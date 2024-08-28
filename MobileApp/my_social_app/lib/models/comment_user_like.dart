import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
part 'comment_user_like.g.dart';

@immutable
@JsonSerializable()
class CommentUserLike{
  final int id;
  final int commentId;
  final int appUserId;
  final DateTime createdAt;
  
  const CommentUserLike({
    required this.id,
    required this.commentId,
    required this.appUserId,
    required this.createdAt
  });


  factory CommentUserLike.fromJson(Map<String, dynamic> json) => _$CommentUserLikeFromJson(json);
  Map<String, dynamic> toJson() => _$CommentUserLikeToJson(this);

  CommentUserLikeState toCommentUserLikeState()
    => CommentUserLikeState(
        key: id,
        userId: appUserId
      );

}