import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/comment_user_like_state/comment_user_like_state.dart';

@immutable
class AddCommentUserLikesAction extends redux.Action{
  final Iterable<CommentUserLikeState> likes;
  const AddCommentUserLikesAction({required this.likes});
}

@immutable
class AddCommentUserLikeAction extends redux.Action{
  final CommentUserLikeState like;
  const AddCommentUserLikeAction({required this.like});
}

@immutable
class RemoveCommentUserLikeAction extends redux.Action{
  final int likeId;
  const RemoveCommentUserLikeAction({required this.likeId});
}