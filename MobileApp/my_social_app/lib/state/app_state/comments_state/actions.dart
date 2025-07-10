import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';

@immutable
class CommentsAction extends AppAction{
  const CommentsAction();
}

@immutable
class CreateCommentAction extends CommentsAction{
  final int? questionId;
  final int? solutionId;
  final int? repliedId;
  final String content;
  const CreateCommentAction({
    required this.questionId,
    required this.solutionId,
    required this.repliedId,
    required this.content
  });
}
@immutable
class CreateCommentsSuccessAction extends CommentsAction{
  final CommentState comment;
  const CreateCommentsSuccessAction({required this.comment});
}

//questions comments;
@immutable
class NextQuestionCommentsAction extends CommentsAction{
  final int questionId;
  const NextQuestionCommentsAction({required this.questionId});
}
@immutable
class NextQuestionCommentsSuccessAction extends CommentsAction{
  final int questionId;
  final Iterable<CommentState> comments;
  const NextQuestionCommentsSuccessAction({required this.questionId, required this.comments});
}
@immutable
class NextQuestionCommentsFailedAction extends CommentsAction{
  final int questionId;
  const NextQuestionCommentsFailedAction({required this.questionId});
}

@immutable
class RefreshQuestionCommentsAction extends CommentsAction{
  final int questionId;
  const RefreshQuestionCommentsAction({required this.questionId});
}
@immutable
class RefreshQuestionCommentsSuccessAction extends CommentsAction{
  final int questionId;
  final Iterable<CommentState> comments;

  const RefreshQuestionCommentsSuccessAction({required this.questionId, required this.comments});
}
@immutable
class RefreshQuestionCommentsFailedAction extends CommentsAction{
  final int questionId;
  const RefreshQuestionCommentsFailedAction({required this.questionId});
}
//questions comments;

//solution comments
@immutable
class NextSolutionCommentsAction extends CommentsAction{
  final int solutionId;
  const NextSolutionCommentsAction({required this.solutionId});
}
@immutable
class NextSolutionCommentsSuccessAction extends CommentsAction{
  final int solutionId;
  final Iterable<CommentState> comments;
  const NextSolutionCommentsSuccessAction({required this.solutionId, required this.comments});
}
@immutable
class NextSolutionCommentsFailedAction extends CommentsAction{
  final int solutionId;
  const NextSolutionCommentsFailedAction({required this.solutionId});
}

@immutable
class RefreshSolutionCommentsAction extends CommentsAction{
  final int solutionId;
  const RefreshSolutionCommentsAction({required this.solutionId});
}
@immutable
class RefreshSolutionCommentsSuccessAction extends CommentsAction{
  final int solutionId;
  final Iterable<CommentState> comments;
  const RefreshSolutionCommentsSuccessAction({required this.solutionId, required this.comments});
}
@immutable
class RefreshSolutionCommentsFailedAction extends CommentsAction{
  final int solutionId;
  const RefreshSolutionCommentsFailedAction({required this.solutionId});
}
//solutions comments;
