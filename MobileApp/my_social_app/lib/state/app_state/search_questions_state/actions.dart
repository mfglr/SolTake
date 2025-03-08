import 'package:flutter/material.dart';
import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/entity_state/id.dart';

@immutable
class FirstSearchQuestionsAction extends AppAction{
  final int? examId;
  final int? subjectId;
  final int? topicId;

  const FirstSearchQuestionsAction({
    required this.examId,
    required this.subjectId,
    required this.topicId
  });
}
@immutable
class FirstSearchQuestionsSuccessAction extends AppAction{
  final Iterable<Id<int>> ids;
  const FirstSearchQuestionsSuccessAction({required this.ids});
}
@immutable
class FirstSearchQuestionsFailedAction extends AppAction{
  const FirstSearchQuestionsFailedAction();
}

@immutable
class NextSearchQuestionsAction extends AppAction{
  final int? examId;
  final int? subjectId;
  final int? topicId;
  const NextSearchQuestionsAction({required this.examId,required this.subjectId,required this.topicId});
}
@immutable
class NextSearchQuestionsSuccessAction extends AppAction{
  final Iterable<Id<int>> ids;
  const NextSearchQuestionsSuccessAction({required this.ids});
}
@immutable
class NextSearchQuestionsFailedAction extends AppAction{
  const NextSearchQuestionsFailedAction();
}