import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';

@immutable
class LoadQuestionAction extends AppAction{
  final int questionId;
  const LoadQuestionAction({required this.questionId});
}
@immutable
class AddQuestionAction extends AppAction{
  final QuestionState value;
  const AddQuestionAction({required this.value});
}
@immutable
class AddQuestionsAction extends AppAction{
  final Iterable<QuestionState> questions;
  const AddQuestionsAction({required this.questions});
}

@immutable
class MarkQuestionSolutionAsCorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkQuestionSolutionAsCorrectAction({required this.questionId,required this.solutionId});
}
@immutable
class MarkQuestionSolutionAsIncorrectAction extends AppAction{
  final int questionId;
  final int solutionId;
  const MarkQuestionSolutionAsIncorrectAction({required this.questionId,required this.solutionId});
}