import 'package:redux/redux.dart';
import 'package:soltake_broker/services/question_service.dart';
import 'package:soltake_broker/state/app_state/app_state.dart';
import 'package:soltake_broker/state/app_state/question_state/actions.dart';
import 'package:soltake_broker/state/entity_state/page.dart';

void nextAllDraftQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is NextAllNotPublishedQuestionsAction){
    QuestionService
      .getAllNotPublishedQuestions(store.state.questions.next)
      .then((questions) => store.dispatch(NextAllNotPublishedQuestionsSuccessAction(questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(const NextAllNotPublishedQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}

void firstAllDraftQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is FirstAllNotPublishedQuestionsAction){
    QuestionService
      .getAllNotPublishedQuestions(Page.init(100, false))
      .then((questions) => store.dispatch(FirstAllNotPublishedQuestionsSuccessAction(questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(const FirstAllNotPublishedQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}

void publishQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is PublishQuestionAction){
    QuestionService
      .publish(action.questionId)
      .then((_) => store.dispatch(PublishQuestionSuccessAction(questionId: action.questionId)));
  }
  next(action);
}

void rejectQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is RejectQuestionAction){
    QuestionService
      .reject(action.questionId)
      .then((_) => store.dispatch(RejectQuestionSuccessAction(questionId: action.questionId)));
  }
  next(action);
}

void deleteQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteQuestionAction){
    QuestionService
      .deleteByAdmin(action.questionId)
      .then((_) => store.dispatch(DeleteQuestionSuccessAction(questionId: action.questionId)));
  }
  next(action);
}