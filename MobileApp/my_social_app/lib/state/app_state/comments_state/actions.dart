import 'package:flutter/foundation.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state_id.dart';

@immutable
class CreateCommentAction{
  final int? questionId;
  final int? solutionId;
  final int? repliedId;
  final int? parentId;
  final String content;

  const CreateCommentAction({
    this.questionId,
    this.solutionId,
    this.repliedId,
    required this.parentId,
    required this.content
  });
}
class CreateCommentSuccessAction extends AppAction{
  final int? questionId;
  final int? solutionId;
  final int? repliedId;
  final int? parentId;
  final CommentStateId comment;

  const CreateCommentSuccessAction({
    required this.questionId,
    required this.solutionId,
    required this.repliedId,
    required this.parentId,
    required this.comment
  });
}
@immutable
class NextCommentsAction extends AppAction{
  final Iterable<CommentStateId> comments;
  const NextCommentsAction({required this.comments});
}
@immutable
class RefreshQuestionCommentsAction extends AppAction{
  final int questionId;
  final Iterable<CommentStateId> comments;
  const RefreshQuestionCommentsAction({required this.questionId, required this.comments});
}
@immutable
class RefreshSolutionCommentsAction extends AppAction{
  final int solutionId;
  final Iterable<CommentStateId> comments;
  const RefreshSolutionCommentsAction({required this.solutionId, required this.comments});
}


