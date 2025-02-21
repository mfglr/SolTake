import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_state.dart';

@immutable
class AddCommentUserLikesAction extends AppAction{
  final Iterable<CommentUserLikeState> likes;
  const AddCommentUserLikesAction({required this.likes});
}

@immutable
class AddCommentUserLikeAction extends AppAction{
  final CommentUserLikeState like;
  const AddCommentUserLikeAction({required this.like});
}

@immutable
class RemoveCommentUserLikeAction extends AppAction{
  final num likeId;
  const RemoveCommentUserLikeAction({required this.likeId});
}