import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class NextVideoQuestionsAction extends AppAction{
  const NextVideoQuestionsAction();
}
@immutable
class NextVideoQuestionsSuccessAction extends AppAction{
  final Iterable<int> questionIds;
  const NextVideoQuestionsSuccessAction({required this.questionIds});
}
@immutable
class NextVideoQuestionsFailedAction extends AppAction{
  const NextVideoQuestionsFailedAction();
}