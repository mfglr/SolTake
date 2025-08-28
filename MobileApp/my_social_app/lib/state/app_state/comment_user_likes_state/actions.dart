//comment likes
import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_likes_state/comment_user_like_state.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';

@immutable
class LikeCommentAction extends AppAction{
  final CommentState comment;
  const LikeCommentAction({required this.comment});
}
@immutable
class LikeCommentSuccessAction extends AppAction{
  final CommentState comment;
  final CommentUserLikeState commentUserLike;
  const LikeCommentSuccessAction({required this.comment, required this.commentUserLike});
}

@immutable
class DislikeCommentAction extends AppAction{
  final CommentState comment;
  const DislikeCommentAction({required this.comment});
}
@immutable
class DislikeCommentSuccessAction extends AppAction{
  final int userId;
  final CommentState comment;
  const DislikeCommentSuccessAction({required this.userId, required this.comment});
}

@immutable
class NextCommentUserLikesAction extends AppAction{
  final int commentId;
  const NextCommentUserLikesAction({required this.commentId});
}
@immutable
class NextCommentUserLikesSuccessAction extends AppAction{
  final int commentId;
  final Iterable<CommentUserLikeState> commentUserLikes;
  const NextCommentUserLikesSuccessAction({required this.commentId, required this.commentUserLikes});
}
@immutable
class NextCommentUserLikesFailedAction extends AppAction{
  final int commentId;
  const NextCommentUserLikesFailedAction({required this.commentId});
}

@immutable
class RefreshCommentUserLikesAction extends AppAction{
  final int commentId;
  const RefreshCommentUserLikesAction({required this.commentId});
}
@immutable
class RefreshCommentUserLikesSuccessAction extends AppAction{
  final int commentId;
  final Iterable<CommentUserLikeState> commentUserLikes;
  const RefreshCommentUserLikesSuccessAction({required this.commentId, required this.commentUserLikes});
}
@immutable
class RefreshCommentUserLikesFailedAction extends AppAction{
  final int commentId;
  const RefreshCommentUserLikesFailedAction({required this.commentId});
}
//comment likes;
