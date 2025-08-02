import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_user_like_state.dart';
part 'comment_user_like.g.dart';

@immutable
@JsonSerializable()
class CommentUserLike{
  final int id;
  final int userId;
  final String userName;
  final String? name;
  final Multimedia? image;
  
  const CommentUserLike({
    required this.id,
    required this.userId,
    required this.userName,
    required this.name,
    required this.image
  });


  factory CommentUserLike.fromJson(Map<String, dynamic> json) => _$CommentUserLikeFromJson(json);
  Map<String, dynamic> toJson() => _$CommentUserLikeToJson(this);

  CommentUserLikeState toCommentUserLikeState()
    => CommentUserLikeState(
        id: id,
        userId: userId,
        userName: userName,
        name: name,
        image: image
      );

}