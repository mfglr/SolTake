import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

class NextHomeQuestionsAction extends AppAction{
  const NextHomeQuestionsAction();
}
@immutable
class NextHomeQuestionsSuccessAction extends AppAction{
  final Iterable<num> questionIds;
  const NextHomeQuestionsSuccessAction({required this.questionIds});
}
@immutable
class NextHomeQuestionsFailedAction extends AppAction{
  const NextHomeQuestionsFailedAction();
}

@immutable
class PrevHomePageQuestionsAction extends AppAction{
  const PrevHomePageQuestionsAction();
}
@immutable
class PrevHomeQuestionsSuccessAction extends AppAction{
  final Iterable<num> questionIds;
  const PrevHomeQuestionsSuccessAction({required this.questionIds});
}
@immutable
class PrevHomeQuestionsFailedAction extends AppAction{
  const PrevHomeQuestionsFailedAction();
}
