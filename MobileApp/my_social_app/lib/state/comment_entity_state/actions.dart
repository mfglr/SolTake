import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';

@immutable
class ChangeRepliesVisibilityAction extends redux.Action{
  final int commentId;
  final bool visibility;
  const ChangeRepliesVisibilityAction({required this.commentId, required this.visibility});
}

@immutable
class AddCommentAction extends redux.Action{
  final CommentState questionComment;
  const AddCommentAction({required this.questionComment});
}
@immutable
class AddCommentsAction extends redux.Action{
  final Iterable<CommentState> comments;
  const AddCommentsAction({required this.comments});
}

@immutable
class LikeCommentAction extends redux.Action{
  final int questionCommentId;
  const LikeCommentAction({required this.questionCommentId});
}
@immutable
class LikeCommentSuccessAction extends redux.Action{
  final int questionCommentId;
  final int userId;
  const LikeCommentSuccessAction({required this.questionCommentId,required this.userId});
}
@immutable
class DislikeCommentAction extends redux.Action{
  final int questionCommentId;
  const DislikeCommentAction({required this.questionCommentId});
}
@immutable
class DislikeCommentSuccessAction extends redux.Action{
  final int questionCommentId;
  final int userId;
  const DislikeCommentSuccessAction({required this.questionCommentId,required this.userId});
}

@immutable
class AddCommentReplyAction extends redux.Action{
  final int commentId;
  final int replyId;
  const AddCommentReplyAction({required this.replyId, required this.commentId});
}

@immutable
class NextPageRepliesAction extends redux.Action{
  final int commentId;
  const NextPageRepliesAction({required this.commentId});
}
@immutable
class NextPageRepliesSuccessAction extends redux.Action{
  final int commentId;
  final Iterable<int> replyIds;
  const NextPageRepliesSuccessAction({required this.commentId, required this.replyIds});
}
@immutable
class NextPageRepliesIfNoReplies extends redux.Action{
  final int commentId;
  const NextPageRepliesIfNoReplies({required this.commentId});
}