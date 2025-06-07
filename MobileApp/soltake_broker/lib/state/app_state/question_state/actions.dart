import 'package:flutter/cupertino.dart';
import 'package:soltake_broker/state/app_state/actions.dart';
import 'package:soltake_broker/state/app_state/question_state/question_state.dart';

@immutable
class QuestionAction extends AppAction{
  const QuestionAction();
}

@immutable
class NextAllNotPublishedQuestionsAction extends QuestionAction{
  const NextAllNotPublishedQuestionsAction();
}
@immutable
class NextAllNotPublishedQuestionsSuccessAction extends QuestionAction{
  final Iterable<QuestionState> questions;
  const NextAllNotPublishedQuestionsSuccessAction({required this.questions});
}
@immutable
class NextAllNotPublishedQuestionsFailedAction extends QuestionAction{
  const NextAllNotPublishedQuestionsFailedAction();
}

@immutable
class FirstAllNotPublishedQuestionsAction extends QuestionAction{
  const FirstAllNotPublishedQuestionsAction();
}
@immutable
class FirstAllNotPublishedQuestionsSuccessAction extends QuestionAction{
  final Iterable<QuestionState> questions;
  const FirstAllNotPublishedQuestionsSuccessAction({required this.questions});
}
@immutable
class FirstAllNotPublishedQuestionsFailedAction extends QuestionAction{
  const FirstAllNotPublishedQuestionsFailedAction();
}

@immutable
class PublishQuestionAction extends QuestionAction{
  final int questionId;
  const PublishQuestionAction({required this.questionId});
}
@immutable
class PublishQuestionSuccessAction extends QuestionAction{
  final int questionId;
  const PublishQuestionSuccessAction({required this.questionId});
}

@immutable
class RemoveQuestionAction extends QuestionAction{
  final int questionId;
  const RemoveQuestionAction({required this.questionId});
}
@immutable
class RemoveQuestionSuccessAction extends QuestionAction{
  final int questionId;
  const RemoveQuestionSuccessAction({required this.questionId});
}