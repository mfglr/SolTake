import 'package:flutter/material.dart';
import 'package:my_social_app/state/actions.dart' as redux;

@immutable
class NextPageOfHomeQuestionsAction extends redux.Action{
  const NextPageOfHomeQuestionsAction();
}
@immutable
class NextPageOfHomeQuestionsSuccessAction extends redux.Action{
  final Iterable<int> questionIds;
  const NextPageOfHomeQuestionsSuccessAction({required this.questionIds});
}
@immutable
class NextPageOfHomeQuestionsIfNoQuestionsAction extends redux.Action{
  const NextPageOfHomeQuestionsIfNoQuestionsAction();
}

@immutable
class AddHomeQuestionAction extends redux.Action{
  final int questionId;
  const AddHomeQuestionAction({required this.questionId});
}