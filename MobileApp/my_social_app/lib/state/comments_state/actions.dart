import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart';
import 'package:my_social_app/state/comments_state/comment_state.dart';

@immutable
class CreateCommentAction extends AppAction{
  final int? questionId;
  final int? solutionId;
  final int? commentId;
  final String content;
  const CreateCommentAction({
    required this.questionId,
    required this.solutionId,
    required this.commentId,
    required this.content
  });
}
@immutable
class CreateCommentSuccessAction extends AppAction{
  final CommentState comment;
  const CreateCommentSuccessAction({
    required this.comment,
  });
}

@immutable
class DeleteCommentAction extends AppAction{
  final CommentState comment;
  const DeleteCommentAction({required this.comment});
}
@immutable
class DeleteCommentSuccessAction extends AppAction{
  final CommentState comment;
  const DeleteCommentSuccessAction({required this.comment});
}



//question comments;
@immutable
class NextQuestionCommentsAction extends AppAction{
  final int questionId;
  const NextQuestionCommentsAction({required this.questionId});
}
@immutable
class NextQuestionCommentsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<CommentState> comments;
  const NextQuestionCommentsSuccessAction({required this.questionId, required this.comments});
}
@immutable
class NextQuestionCommentsFailedAction extends AppAction{
  final int questionId;
  const NextQuestionCommentsFailedAction({required this.questionId});
}

@immutable
class RefreshQuestionCommentsAction extends AppAction{
  final int questionId;
  const RefreshQuestionCommentsAction({required this.questionId});
}
@immutable
class RefreshQuestionCommentsSuccessAction extends AppAction{
  final int questionId;
  final Iterable<CommentState> comments;
  const RefreshQuestionCommentsSuccessAction({required this.questionId, required this.comments});
}
@immutable
class RefreshQuestionCommentsFailedAction extends AppAction{
  final int questionId;
  const RefreshQuestionCommentsFailedAction({required this.questionId});
}
//question comments;

//solution comments;
@immutable
class NextSolutionCommentsAction extends AppAction{
  final int solutionId;
  const NextSolutionCommentsAction({required this.solutionId});
}
@immutable
class NextSolutionCommentsSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<CommentState> comments;
  const NextSolutionCommentsSuccessAction({required this.solutionId, required this.comments});
}
@immutable
class NextSolutionCommentsFailedAction extends AppAction{
  final int solutionId;
  const NextSolutionCommentsFailedAction({required this.solutionId});
}

@immutable
class RefreshSolutionCommentsAction extends AppAction{
  final int solutionId;
  const RefreshSolutionCommentsAction({required this.solutionId});
}
@immutable
class RefreshSolutionCommentsSuccessAction extends AppAction{
  final int solutionId;
  final Iterable<CommentState> comments;
  const RefreshSolutionCommentsSuccessAction({required this.solutionId, required this.comments});
}
@immutable
class RefreshSolutionCommentsFailedAction extends AppAction{
  final int solutionId;
  const RefreshSolutionCommentsFailedAction({required this.solutionId});
}
//solution comments;

//comment comments;
@immutable
class NextCommentCommentsAction extends AppAction{
  final int commentId;
  const NextCommentCommentsAction({required this.commentId});
}
@immutable
class NextCommentCommentsSuccessAction extends AppAction{
  final int commentId;
  final Iterable<CommentState> comments;
  const NextCommentCommentsSuccessAction({required this.commentId, required this.comments});
}
@immutable
class NextCommentCommentsFailedAction extends AppAction{
  final int commentId;
  const NextCommentCommentsFailedAction({required this.commentId});
}

@immutable
class RefreshCommentCommentsAction extends AppAction{
  final int commentId;
  const RefreshCommentCommentsAction({required this.commentId});
}
@immutable
class RefreshCommentCommentsSuccessAction extends AppAction{
  final int commentId;
  final Iterable<CommentState> comments;
  const RefreshCommentCommentsSuccessAction({required this.commentId, required this.comments});
}
@immutable
class RefreshCommentCommentsFailedAction extends AppAction{
  final int commentId;
  const RefreshCommentCommentsFailedAction({required this.commentId});
}
//solution comments;
