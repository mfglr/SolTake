import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/draft_questions/actions.dart';
import 'package:my_social_app/state/app_state/draft_questions/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

void nextDraftQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextDraftQuestionsAction){
    QuestionService()
      .getDraftQuestions(getNextDraftQuestionsPage(store))
      .then(
        (questions) => 
          store.dispatch(NextDraftQuestionsSuccessAction(questions: questions.map((question) => question.toQuestionState())))
      )
      .catchError((e){
        store.dispatch(const NextDraftQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}