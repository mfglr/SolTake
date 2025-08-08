import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/question_user_save_service.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

//questions
void loadQuestionMiddleware(Store<AppState> store,action, NextDispatcher next){
  if(action is LoadQuestionAction){
    QuestionService()
      .getById(action.questionId)
      .then((question) => store.dispatch(LoadQuestionSuccessAction(question: question.toQuestionState())))
      .catchError((e){
        if(e is BackendException){
          if(e.statusCode == 404){
            store.dispatch(LoadQuestionNotFoundAction(questionId: action.questionId));
          }
          else{
            store.dispatch(LoadQuestionFailedAction(questionId: action.questionId));
          }
        }
        throw e;
      });
  }
  next(action);
}
void deleteQuestionMiddleware(Store<AppState> store,action,NextDispatcher next){
  if(action is DeleteQuestionAction){
    QuestionService()
      .delete(action.question.id)
      .then((_) =>store.dispatch(DeleteQuestionSuccessAction(question: action.question)));
  }
  next(action);
}
//questions

//questionUserSaves
void nextQuestionUserSavesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionUserSavesAction){
    final pagination = selectQuestionUserSaves(store);
    QuestionUserSaveService()
      .get(pagination.next)
      .then((e) => store.dispatch(NextQuestionUserSavesSuccessAction(questionUserSaves: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const NextQuestionUserSavesFailedAction());
        throw e;
      });
  }
  next(action);
}
void refreshQuestionUserSavesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionUserSavesAction){
    final pagination = selectQuestionUserSaves(store);
    QuestionUserSaveService()
      .get(pagination.first)
      .then((e) => store.dispatch(RefreshQuestionUserSavesSuccessAction(questionUserSaves: e.map((e) => e.toState()))))
      .catchError((e){
        store.dispatch(const RefreshQuestionUserSavesFailedAction());
        throw e;
      });
  }
  next(action);
}
void saveQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is SaveQuestionAction){
    QuestionUserSaveService()
      .create(action.question.id)
      .then((response) => store.dispatch(SaveQuestionSuccessAction(
        questionUserSave: QuestionUserSaveState.create(response.id, action.question)
      )));
  }
  next(action);
}
void unsaveQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is UnsaveQuestionAction){
    QuestionUserSaveService()
      .delete(action.question.id)
      .then((_) => store.dispatch(UnsaveQuestionSuccessAction(question: action.question)));
  }
  next(action);
}
//questionUserSaves


