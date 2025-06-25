import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class FirstHomeQuestionsAction extends AppAction{
  const FirstHomeQuestionsAction();
}
@immutable
class FirstHomeQuestionsSuccessAction extends AppAction{
  final Iterable<int> questionIds;
  const FirstHomeQuestionsSuccessAction({required this.questionIds});
}
@immutable
class FirstHomeQuestionsFailedAction extends AppAction{
  const FirstHomeQuestionsFailedAction();
}

class NextHomeQuestionsAction extends AppAction{
  const NextHomeQuestionsAction();
}
@immutable
class NextHomeQuestionsSuccessAction extends AppAction{
  final Iterable<int> questionIds;
  const NextHomeQuestionsSuccessAction({required this.questionIds});
}
@immutable
class NextHomeQuestionsFailedAction extends AppAction{
  const NextHomeQuestionsFailedAction();
}

@immutable
class PrevHomeQuestionsAction extends AppAction{
  const PrevHomeQuestionsAction();
}
@immutable
class PrevHomeQuestionsSuccessAction extends AppAction{
  final Iterable<int> questionIds;
  const PrevHomeQuestionsSuccessAction({required this.questionIds});
}
@immutable
class PrevHomeQuestionsFailedAction extends AppAction{
  const PrevHomeQuestionsFailedAction();
}

@immutable
class DeleteHomeQuestionAction extends AppAction{
  final int id;
  const DeleteHomeQuestionAction({required this.id});
}