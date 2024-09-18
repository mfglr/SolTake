import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/app_state/solution_entity_state/solution_state.dart';

@immutable
class CreateCommentAction extends AppAction{
  const CreateCommentAction();
}
@immutable
class CreateCommentSuccessAction extends AppAction{
  const CreateCommentSuccessAction();
}

@immutable
class ChangeContentAction extends AppAction{
  final String content;
  const ChangeContentAction({required this.content});
}
@immutable
class ChangeQuestionAction extends AppAction{
  final QuestionState question;
  const ChangeQuestionAction({required this.question});
}
@immutable
class ChangeSolutionAction extends AppAction{
  final SolutionState solution;
  const ChangeSolutionAction({required this.solution});
}
@immutable
class ChangeCommentAction extends AppAction{
  final CommentState comment;
  const ChangeCommentAction({required this.comment});
}
@immutable
class CancelReplyAction extends AppAction{
  const CancelReplyAction();
}
@immutable
class ClearCreateCommentStateAction extends AppAction{
  const ClearCreateCommentStateAction();
}