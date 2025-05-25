import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/state/app_state/draft_questions/actions.dart';
import 'package:my_social_app/state/app_state/draft_questions/selectors.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';

void nextDraftQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextDraftQuestionsAction){
    QuestionService()
      .getDraftQuestions(getNextDraftQuestionsPage(store))
      .then(
        (questions){
          store.dispatch(NextDraftQuestionsSuccessAction(questionIds: questions.map((question) => question.id)));
          store.dispatch(AddQuestionsAction(questions: questions.map((e) => e.toQuestionState())));
          store.dispatch(AddExamsAction(exams: questions.map((e) => e.exam.toExamState())));
          store.dispatch(AddSubjectsAction(subjects: questions.map((e) => e.subject.toSubjectState())));
          store.dispatch(AddTopicsAction(topics: questions.map((e) => e.topic).where((e) => e != null).map((e) => e!.toTopicState())));
        }
      )
      .catchError((e){
        store.dispatch(const NextDraftQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}