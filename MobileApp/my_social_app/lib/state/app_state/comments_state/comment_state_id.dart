import 'package:flutter/foundation.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:my_social_app/constants/record_per_page.dart';
import 'package:my_social_app/models/comment.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';
import 'package:my_social_app/state/entity_state/pagination.dart';
import 'package:my_social_app/state/entity_state/pagination_widget/paginable.dart';

@immutable
class CommentStateId extends CommentState implements Paginable<int> {
  CommentStateId({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.isOwner,
    required super.userName,
    required super.userId,
    required super.isEdited,
    required super.content,
    required super.isLiked,
    required super.numberOfLikes,
    required super.numberOfReplies,
    required super.questionId,
    required super.solutionId,
    required super.parentId,
    required super.likes,
    required super.image
  });

  @override
  int get paginationProperty => id;

  CommentStateId _optional({
    String? newUserName,
    bool? newIsEdited,
    String? newContent,
    bool? newIsLiked,
    int? newNumberOfLikes,
    int? newNumberOfReplies,
    Pagination<int,CommentUserLikeState>? newLikes,
    Multimedia? newImage,
  }) => CommentStateId(
      id: id,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isOwner: isOwner,
      userName: newUserName ?? userName,
      userId: userId,
      isEdited: newIsEdited ?? isEdited,
      content: newContent ?? content,
      isLiked: newIsLiked ?? isLiked,
      numberOfLikes: newNumberOfLikes ?? numberOfLikes,
      numberOfReplies: newNumberOfReplies ?? numberOfReplies,
      questionId: questionId,
      solutionId: solutionId,
      parentId: parentId,
      likes: newLikes ?? likes,
      image: newImage ?? image
    );

  factory CommentStateId.map(Comment comment) =>
    CommentStateId(
      id: comment.id,
      createdAt: comment.createdAt,
      updatedAt: comment.updatedAt,
      isOwner: comment.isOwner,
      userName: comment.userName,
      userId: comment.userId,
      isEdited: comment.isEdited,
      content: comment.content,
      isLiked: comment.isLiked,
      numberOfLikes: comment.numberOfLikes,
      numberOfReplies: comment.numberOfReplies,
      questionId: comment.questionId,
      solutionId: comment.solutionId,
      parentId: comment.parentId,
      likes: Pagination.init(usersPerPage,true),
      image: comment.image
    );

  CommentStateId increaseNumberOfChildren() => _optional(newNumberOfReplies: numberOfReplies + 1);
}