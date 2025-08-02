import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/entity_state/pagination_state/pagination.dart';
part 'comment.g.dart';


@JsonSerializable()
@immutable
class Comment{
  final int id;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isOwner;
  final String userName;
  final int userId;
  final bool isEdited;
  final String content;
  final bool isLiked;
  final int numberOfLikes;
  final int numberOfChildren;
  final int? questionId;
  final int? solutionId;
  final int? parentId;
  final Multimedia? image;

  const Comment({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isOwner,
    required this.userName,
    required this.userId,
    required this.isEdited,
    required this.content,
    required this.isLiked,
    required this.numberOfLikes,
    required this.numberOfChildren,
    required this.questionId,
    required this.solutionId,
    required this.parentId,
    required this.image
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);

  CommentState toCommentState()
    => CommentState(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isOwner: isOwner,
      userId: userId,
      userName: userName,
      questionId: questionId,
      isEdited: isEdited,
      content: content,
      numberOfLikes: numberOfLikes,
      isLiked: isLiked,
      likes: Pagination.init(usersPerPage,true),
      children: Pagination.init(commentsPerPage,true),
      numberOfChildren: numberOfChildren,
      parentId: parentId,
      solutionId: solutionId,
      image: image
    );

}