import 'package:my_social_app/state/app_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/question_state.dart';

class DraftQuestionsAction extends AppAction{
  const DraftQuestionsAction();
}

class NextDraftQuestionsAction extends DraftQuestionsAction{
  const NextDraftQuestionsAction();
}
class NextDraftQuestionsSuccessAction extends DraftQuestionsAction{
  final Iterable<QuestionState> questions;
  const NextDraftQuestionsSuccessAction({required this.questions});
}
class NextDraftQuestionsFailedAction extends DraftQuestionsAction{
  const NextDraftQuestionsFailedAction();
}