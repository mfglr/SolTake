import 'package:flutter/material.dart';

@immutable
class NextVideoQuestionsAction{
  const NextVideoQuestionsAction();
}
@immutable
class NextVideoQuestionsSuccessAction{
  final Iterable<int> questionIds;
  const NextVideoQuestionsSuccessAction({required this.questionIds});
}
@immutable
class NextVideoQuestionsFailedAction{
  const NextVideoQuestionsFailedAction();
}