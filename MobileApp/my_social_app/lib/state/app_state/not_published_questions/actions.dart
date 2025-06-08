import 'package:my_social_app/state/app_state/actions.dart';

class NotPublishedQuestionsAction extends AppAction{
  const NotPublishedQuestionsAction();
}

class NextNotPublishedQuestionsAction extends NotPublishedQuestionsAction{
  const NextNotPublishedQuestionsAction();
}
class NextNotPublishedQuestionsSuccessAction extends NotPublishedQuestionsAction{
  final Iterable<int> questionIds;
  const NextNotPublishedQuestionsSuccessAction({required this.questionIds});
}
class NextNotPublishedQuestionsFailedAction extends NotPublishedQuestionsAction{
  const NextNotPublishedQuestionsFailedAction();
}

class AddNotPublishedQuestionAction extends NotPublishedQuestionsAction{
  final int questionId;
  const AddNotPublishedQuestionAction({required this.questionId});
}

class RemoveNotPublishedQuestionAction extends NotPublishedQuestionsAction{
  final int questionId;
  const RemoveNotPublishedQuestionAction({required this.questionId});
}