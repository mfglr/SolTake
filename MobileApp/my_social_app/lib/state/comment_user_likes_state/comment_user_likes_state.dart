import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/comment_user_likes_state/comment_user_like_state.dart';
import 'package:my_social_app/state/comment_user_likes_state/selectors.dart';
import 'package:my_social_app/state/comments_state/comment_state.dart';
import 'package:my_social_app/packages/entity_state/map_extentions.dart';
import 'package:my_social_app/packages/entity_state/pagination.dart';

@immutable
class CommentUserLikesState {
  final Map<int, Pagination<int,CommentUserLikeState>> commentUserLikes;

  const CommentUserLikesState({required this.commentUserLikes});


  CommentUserLikesState like(CommentState comment, CommentUserLikeState like) =>
    CommentUserLikesState(
      commentUserLikes: commentUserLikes.setOne(
        comment.id,
        selectCommentUserLikesFromState(this, comment.id).addOne(like)
      )
    );
  CommentUserLikesState dislike(CommentState comment, int userId) =>
    CommentUserLikesState(
      commentUserLikes: commentUserLikes.setOne(
        comment.id,
        selectCommentUserLikesFromState(this, comment.id).where((e) => e.userId != userId)
      )
    );

  CommentUserLikesState startNext(int commentId) =>
    CommentUserLikesState(
      commentUserLikes: commentUserLikes.setOne(
        commentId,
        selectCommentUserLikesFromState(this, commentId).startLoadingNext()
      )
    );
  CommentUserLikesState addNext(int commentId, Iterable<CommentUserLikeState> likes) =>
    CommentUserLikesState(
      commentUserLikes: commentUserLikes.setOne(
        commentId,
        selectCommentUserLikesFromState(this, commentId).addNextPage(likes)
      )
    );
  CommentUserLikesState refresh(int commentId, Iterable<CommentUserLikeState> likes) =>
    CommentUserLikesState(
      commentUserLikes: commentUserLikes.setOne(
        commentId,
        selectCommentUserLikesFromState(this, commentId).refreshPage(likes)
      )
    );
  CommentUserLikesState stopNext(int commentId) =>
    CommentUserLikesState(
      commentUserLikes: commentUserLikes.setOne(
        commentId,
        selectCommentUserLikesFromState(this, commentId).stopLoadingNext()
      )
    );
}