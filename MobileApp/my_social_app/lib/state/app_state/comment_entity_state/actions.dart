import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart' as redux;
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';

@immutable
class LoadCommentAction extends redux.Action{
  final int commentId;
  const LoadCommentAction({required this.commentId});
}
@immutable
class LoadCommentsAction extends redux.Action{
  final Iterable<int> commentIds;
  const LoadCommentsAction({required this.commentIds});
}

@immutable
class GetNextPageCommentLikesIfNoPageAction extends redux.Action{
  final int commentId;
  const GetNextPageCommentLikesIfNoPageAction({required this.commentId});
}
@immutable
class GetNextPageCommentLikesIfReadyAction extends redux.Action{
  final int commentId;
  const GetNextPageCommentLikesIfReadyAction({required this.commentId});
}
@immutable
class GetNextPageCommentLikesAction extends redux.Action{
  final int commentId;
  const GetNextPageCommentLikesAction({required this.commentId});
}
@immutable
class AddNextPageCommentLikesAction extends redux.Action{
  final int commentId;
  final Iterable<int> likeIds;
  const AddNextPageCommentLikesAction({required this.commentId, required this.likeIds});
}

@immutable
class ChangeRepliesVisibilityAction extends redux.Action{
  final int commentId;
  final bool visibility;
  const ChangeRepliesVisibilityAction({required this.commentId, required this.visibility});
}

@immutable
class AddCommentAction extends redux.Action{
  final CommentState comment;
  const AddCommentAction({required this.comment});
}
@immutable
class RemoveCommentAction extends redux.Action{
  final CommentState comment;
  const RemoveCommentAction({required this.comment});
}
@immutable
class RemoveCommentSuccessAction extends redux.Action{
  final int commentId;
  const RemoveCommentSuccessAction({required this.commentId});
}
@immutable
class AddCommentsAction extends redux.Action{
  final Iterable<CommentState> comments;
  const AddCommentsAction({required this.comments});
}

@immutable
class LikeCommentAction extends redux.Action{
  final int commentId;
  const LikeCommentAction({required this.commentId});
}
@immutable
class LikeCommentSuccessAction extends redux.Action{
  final int commentId;
  final int likeId;
  const LikeCommentSuccessAction({required this.commentId,required this.likeId});
}
@immutable
class DislikeCommentAction extends redux.Action{
  final int commentId;
  const DislikeCommentAction({required this.commentId});
}
@immutable
class DislikeCommentSuccessAction extends redux.Action{
  final int commentId;
  final int likeId;
  const DislikeCommentSuccessAction({required this.commentId,required this.likeId});
}

@immutable
class GetNextPageCommentRepliesIfNoPageAction extends redux.Action{
  final int commentId;
  const GetNextPageCommentRepliesIfNoPageAction({required this.commentId});
}
@immutable
class GetNextPageCommentRepliesIfReadyAction extends redux.Action{
  final int commentId;
  const GetNextPageCommentRepliesIfReadyAction({required this.commentId});
}
@immutable
class GetNextPageCommentRepliesAction extends redux.Action{
  final int commentId;
  const GetNextPageCommentRepliesAction({required this.commentId});
}
@immutable
class AddPrevPageCommentRepliesAction extends redux.Action{
  final int commentId;
  final Iterable<int> replyIds;
  const AddPrevPageCommentRepliesAction({required this.commentId, required this.replyIds});
}
@immutable
class AddCommentReplyAction extends redux.Action{
  final int commentId;
  final int replyId;
  const AddCommentReplyAction({required this.replyId, required this.commentId});
}
@immutable
class RemoveCommentReplyAction extends redux.Action{
  final int commentId;
  final int replyId;
  const RemoveCommentReplyAction({required this.commentId, required this.replyId});
}
