import 'package:my_social_app/state/app_state/actions.dart';

class DraftQuestionsAction extends AppAction{
  const DraftQuestionsAction();
}

class NextDraftQuestionsAction extends DraftQuestionsAction{
  const NextDraftQuestionsAction();
}
class NextDraftQuestionsSuccessAction extends DraftQuestionsAction{
  final Iterable<int> questionIds;
  const NextDraftQuestionsSuccessAction({required this.questionIds});
}
class NextDraftQuestionsFailedAction extends DraftQuestionsAction{
  const NextDraftQuestionsFailedAction();
}

class AddDraftQuestionAction extends DraftQuestionsAction{
  final int questionId;
  const AddDraftQuestionAction({required this.questionId});
}