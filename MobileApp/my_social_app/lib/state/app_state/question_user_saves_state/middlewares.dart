import 'package:my_social_app/services/question_user_save_service.dart';
import 'package:my_social_app/state/app_state/exam_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/actions.dart';
import 'package:my_social_app/state/app_state/question_user_saves_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:my_social_app/state/app_state/subject_entity_state/actions.dart';
import 'package:my_social_app/state/app_state/topic_entity_state/actions.dart';
import 'package:redux/redux.dart';

void createQuestionUserSaveMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is CreateQuestionUserSaveAction){
    QuestionUserSaveService()
      .create(action.questionId)
      .then((response){
        store.dispatch(CreateQuestionUserSaveSuccessAction(questionUserSave: QuestionUserSaveState(id: response.id, questionId: action.questionId)));
        store.dispatch(SaveQuestionAction(questionId: action.questionId));
      });
  }
  next(action);
}
void deleteQuestionUserSaveMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DeleteQuestionUserSaveAction){
    QuestionUserSaveService()
      .delete(action.questionId)
      .then((_){
        store.dispatch(DeleteQuestionUserSaveSuccesAction(questionId: action.questionId));
        store.dispatch(UnsaveQuestionAction(questionId: action.questionId));
      });
  }
  next(action);
}

void nextQuestionUserSavesMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextQuestionUserSavesAction){
    QuestionUserSaveService()
      .get(store.state.questionUserSaves.next)
      .then((questionUserSaves){
        store.dispatch(NextQuestionUserSavesSuccessAction(questionUserSaves: questionUserSaves.map((e) => e.toQuestionUserSaveState())));

        store.dispatch(AddQuestionsAction(questions: questionUserSaves.map((e) => e.question.toQuestionState())));
        store.dispatch(AddExamsAction(exams: questionUserSaves.map((e) => e.question.exam.toExamState())));
        store.dispatch(AddSubjectsAction(subjects: questionUserSaves.map((e) => e.question.subject.toSubjectState())));
        store.dispatch(AddTopicsAction(topics: questionUserSaves.map((e) => e.question.topic).where((e) => e != null).map((e) => e!.toTopicState())));
      })
      .catchError((e){
        store.dispatch(const NextQuestionUserSavesFailedAction());
        throw e;
      });
  }
  next(action);
}