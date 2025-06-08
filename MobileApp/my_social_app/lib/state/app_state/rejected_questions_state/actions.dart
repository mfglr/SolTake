import 'package:flutter/widgets.dart';
import 'package:my_social_app/state/app_state/actions.dart';

@immutable
class RejectedQuestionsAction extends AppAction{
  const RejectedQuestionsAction();
}

@immutable
class NextRejectedQuestionsAction extends RejectedQuestionsAction{
  const NextRejectedQuestionsAction();
}
@immutable
class NextRejectedQuestionsSuccessAction extends RejectedQuestionsAction{
  final Iterable<int> questionIds;
  const NextRejectedQuestionsSuccessAction({required this.questionIds});
}
@immutable
class NextRejectedQuestionsFailedAction extends RejectedQuestionsAction{
  const NextRejectedQuestionsFailedAction();
}

@immutable
class RemoveRejectedQuestionAction extends RejectedQuestionsAction{
  final int questionId;
  const RemoveRejectedQuestionAction({required this.questionId});
}