import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comments_state/comment_state.dart';
import 'package:my_social_app/state/app_state/questions_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class CreateCommentAction extends AppAction{
  final QuestionState? question;
  final SolutionState? solution;
  final CommentState? parent;
  final CommentState? replied;
  final String content;
  const CreateCommentAction({
    required this.question,
    required this.solution,
    required this.parent,
    required this.replied,
    required this.content
  });
}
@immutable
class CreateCommentsSuccessAction extends AppAction{
   final QuestionState? question;
  final SolutionState? solution;
  final CommentState? parent;
  final CommentState? replied;
  final CommentState comment;
  const CreateCommentsSuccessAction({
    required this.question,
    required this.solution,
    required this.parent,
    required this.replied,
    required this.comment,
  });
}

//questions comments;
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
//questions comments;

//solution comments
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
//solutions comments;

//children
@immutable
class NextCommentChildrenAction extends AppAction{
  final int parentId;
  const NextCommentChildrenAction({required this.parentId});
}
@immutable
class NextCommentChildrenSuccessAction extends AppAction{
  final int parentId;
  final Iterable<CommentState> comments;
  const NextCommentChildrenSuccessAction({
    required this.parentId,
    required this.comments
  });
}
@immutable
class NextCommentChildrenFailedAction extends AppAction{
  final int parentId;
  const NextCommentChildrenFailedAction({
    required this.parentId,
  });
}

@immutable
class RefreshCommentChildrenAction extends AppAction{
  final int parentId;
  const RefreshCommentChildrenAction({required this.parentId});
}
@immutable
class RefreshCommentChildrenSuccessAction extends AppAction{
  final int parentId;
  final Iterable<CommentState> comments;
  const RefreshCommentChildrenSuccessAction({
    required this.parentId,
    required this.comments
  });
}
@immutable
class RefreshCommentChildrenFailedAction extends AppAction{
  final int parentId;
  const RefreshCommentChildrenFailedAction({
    required this.parentId,
  });
}
//children
