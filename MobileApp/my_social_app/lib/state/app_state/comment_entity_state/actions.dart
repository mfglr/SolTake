import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_user_like_state.dart';

@immutable
class CreateCommentAction{
  final int? questionId;
  final int? solutionId;
  final int? repliedId;
  final String content;

  const CreateCommentAction({
    this.questionId,
    this.solutionId,
    this.repliedId,
    required this.content
  });
}

@immutable
class LoadCommentAction extends AppAction{
  final int commentId;
  const LoadCommentAction({required this.commentId});
}
@immutable
class LoadCommentsAction extends AppAction{
  final Iterable<int> commentIds;
  const LoadCommentsAction({required this.commentIds});
}
@immutable
class AddCommentAction extends AppAction{
  final CommentState comment;
  const AddCommentAction({required this.comment});
}
@immutable
class AddCommentsAction extends AppAction{
  final Iterable<CommentState> comments;
  const AddCommentsAction({required this.comments});
}
@immutable
class RemoveCommentAction extends AppAction{
  final CommentState comment;
  const RemoveCommentAction({required this.comment});
}
@immutable
class RemoveCommentSuccessAction extends AppAction{
  final num commentId;
  const RemoveCommentSuccessAction({required this.commentId});
}


@immutable
class NextCommentLikesAction extends AppAction{
  final int commentId;
  const NextCommentLikesAction({required this.commentId});
}
@immutable
class NextCommentLikesSuccessAction extends AppAction{
  final int commentId;
  final Iterable<CommentUserLikeState> commentUserLikes;
  const NextCommentLikesSuccessAction({required this.commentId, required this.commentUserLikes});
}
@immutable
class NextCommentLikesFailedAction extends AppAction{
  final int commentId;
  const NextCommentLikesFailedAction({required this.commentId});
}

@immutable
class LikeCommentAction extends AppAction{
  final int commentId;
  const LikeCommentAction({required this.commentId});
}
@immutable
class LikeCommentSuccessAction extends AppAction{
  final int commentId;
  final CommentUserLikeState commentUserLike;
  const LikeCommentSuccessAction({required this.commentId,required this.commentUserLike});
}
@immutable
class DislikeCommentAction extends AppAction{
  final int commentId;
  const DislikeCommentAction({required this.commentId});
}
@immutable
class DislikeCommentSuccessAction extends AppAction{
  final int commentId;
  final int userId;
  const DislikeCommentSuccessAction({required this.commentId,required this.userId});
}
@immutable
class AddNewCommentLikeAction extends AppAction{
  final int commentId;
  final CommentUserLikeState commentUserLike;
  const AddNewCommentLikeAction({required this.commentId, required this.commentUserLike});
}


@immutable
class ChangeRepliesVisibilityAction extends AppAction{
  final int commentId;
  final bool visibility;
  const ChangeRepliesVisibilityAction({required this.commentId, required this.visibility});
}


@immutable
class NextCommentChildrenAction extends AppAction{
  final int commentId;
  const NextCommentChildrenAction({required this.commentId});
}
@immutable
class NextCommentChildrenSuccessAction extends AppAction{
  final int commentId;
  final Iterable<int> childIds;
  const NextCommentChildrenSuccessAction({required this.commentId, required this.childIds});
}
@immutable
class NextCommentChildrenFailedAction extends AppAction{
  final int commentId;
  const NextCommentChildrenFailedAction({required this.commentId});
}
@immutable
class AddCommentReplyAction extends AppAction{
  final int commentId;
  final int replyId;
  const AddCommentReplyAction({required this.replyId, required this.commentId});
}
@immutable
class RemoveCommentReplyAction extends AppAction{
  final int commentId;
  final int replyId;
  const RemoveCommentReplyAction({required this.commentId, required this.replyId});
}
@immutable
class AddNewCommentReplyAction extends AppAction{
  final int commentId;
  final int replyId;
  const AddNewCommentReplyAction({required this.commentId, required this.replyId});
}