import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;
import 'package:my_social_app/state/comment_entity_state/comment_state.dart';
import 'package:my_social_app/state/question_entity_state/question_state.dart';
import 'package:my_social_app/state/solution_entity_state/solution_state.dart';

@immutable
class CreateCommentAction extends redux.Action{
  const CreateCommentAction();
}
@immutable
class CreateCommentSuccessAction extends redux.Action{
  const CreateCommentSuccessAction();
}

@immutable
class ChangeContentAction extends redux.Action{
  final String content;
  const ChangeContentAction({required this.content});
}
@immutable
class ChangeQuestionAction extends redux.Action{
  final QuestionState question;
  const ChangeQuestionAction({required this.question});
}
@immutable
class ChangeSolutionAction extends redux.Action{
  final SolutionState solution;
  const ChangeSolutionAction({required this.solution});
}
@immutable
class ChangeCommentAction extends redux.Action{
  final CommentState comment;
  final bool isRoot;
  const ChangeCommentAction({required this.comment,required this.isRoot});
}
@immutable
class CancelReplyAction extends redux.Action{
  const CancelReplyAction();
}
@immutable
class ChangeHintTextAction extends redux.Action{
  final String hintText;
  const ChangeHintTextAction({required this.hintText});
}
@immutable
class PressReplyButtonAction extends redux.Action{
  final CommentState comment;
  const PressReplyButtonAction({required this.comment});
}