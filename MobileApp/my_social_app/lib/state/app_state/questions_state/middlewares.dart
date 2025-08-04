import 'package:my_social_app/exceptions/backend_exception.dart';
import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/question_user_like_service.dart';
import 'package:my_social_app/services/question_user_save_service.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/question_user_save_state.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/search_page_state/actions.dart';
import 'package:my_social_app/state/app_state/search_page_state/selectors.dart';
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

//search page state
void changeExamMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ChangeExamAction){
    final searchPageState = selectSearchPageState(store).changeExam(action.exam);
    final pagination = selectSearchPageQuestion(store);
    QuestionService()
      .searchQuestions(searchPageState.exam?.id, searchPageState.subject?.id, searchPageState.topic?.id, pagination.first)
      .then((questions) => store.dispatch(RefreshSearchPageQuestionsSuccessAction(
        questions: questions.map(((e) => e.toQuestionState()))
      )))
      .catchError((e){
        store.dispatch(const RefreshSearchPageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
void changeSubjectMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ChangeSubjectAction){
    final searchPageState = selectSearchPageState(store).changeSubject(action.subject);
    final pagination = selectSearchPageQuestion(store);
    QuestionService()
      .searchQuestions(searchPageState.exam?.id, searchPageState.subject?.id, searchPageState.topic?.id, pagination.first)
      .then((questions) => store.dispatch(RefreshSearchPageQuestionsSuccessAction(
        questions: questions.map(((e) => e.toQuestionState()))
      )))
      .catchError((e){
        store.dispatch(const RefreshSearchPageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
void changeTopicMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is ChangeTopicAction){
    final searchPageState = selectSearchPageState(store).changeTopic(action.topic);
    final pagination = selectSearchPageQuestion(store);
    QuestionService()
      .searchQuestions(searchPageState.exam?.id, searchPageState.subject?.id, searchPageState.topic?.id, pagination.first)
      .then((questions) => store.dispatch(RefreshSearchPageQuestionsSuccessAction(
        questions: questions.map(((e) => e.toQuestionState()))
      )))
      .catchError((e){
        store.dispatch(const RefreshSearchPageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
//search page state

//question user likes;
void likeQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is LikeQuestionAction){
    QuestionUserLikeService()
      .like(action.question.id)
      .then((response) => store.dispatch(LikeQuestionSuccessAction(
        question: action.question,
        questionUserLike: response.toQuestionUserLikeState()
      )));
  }
  next(action);
}
void dislikeQuestionMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is DislikeQuestionAction){
    QuestionUserLikeService()
      .dislike(action.question.id)
      .then((_) => store.dispatch(DislikeQuestionSuccessAction(
        question: action.question,
        userId: store.state.login.login!.id
      )));
  }
  next(action);
}
void nextQuestionUserLikesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextQuestionUserLikesAction){
    final pagination = selectQuestionUserLikes(store, action.questionId);
    QuestionUserLikeService()
      .getQuestionLikes(action.questionId, pagination.next)
      .then((likes) => store.dispatch(NextQuestionUserLikesSuccessAction(questionId: action.questionId, questionUserLikes: likes.map((e) => e.toQuestionUserLikeState()))))
      .catchError((e){
        store.dispatch(NextQuestionUserLikesFailedAction(questionId: action.questionId));
        throw e;
      });
  }
  next(action);
}
void refreshQuestionUserLikesMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshQuestionUserLikesAction){
    final pagination = selectQuestionUserLikes(store, action.questionId);
    QuestionUserLikeService()
      .getQuestionLikes(action.questionId, pagination.first)
      .then((likes) => store.dispatch(RefreshQuestionUserLikesSuccessAction(questionId: action.questionId, questionUserLikes: likes.map((e) => e.toQuestionUserLikeState()))))
      .catchError((e){
        store.dispatch(RefreshQuestionUserLikesFailedAction(questionId: action.questionId));
        throw e;
      }); 
  }
  next(action);
}
//question user likes;

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


//subject questions
void nextSubjectQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextSubjectQuestionsAction){
    final pagination = selectSubjectQuestions(store, action.subjectId);
    QuestionService()
      .getBySubjectId(action.subjectId, pagination.next)
      .then((questions) => store.dispatch(NextSubjectQuestionsSuccessAction(
        subjectId: action.subjectId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(NextSubjectQuestionsFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
void refreshSubjectQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshSubjectQuestionsAction){
    final pagination = selectSubjectQuestions(store, action.subjectId);
    QuestionService()
      .getBySubjectId(action.subjectId, pagination.first)
      .then((questions) => store.dispatch(RefreshSubjectQuestionsSuccessAction(
        subjectId: action.subjectId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(RefreshSubjectQuestionsFailedAction(subjectId: action.subjectId));
        throw e;
      });
  }
  next(action);
}
//subject questions

//topic questions
void nextTopicQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextTopicQuestionsAction){
    final pagination = selectTopicQuestions(store, action.topicId);
    QuestionService()
      .getByTopicId(action.topicId, pagination.next)
      .then((questions) => store.dispatch(NextTopicQuestionsSuccessAction(
        topicId: action.topicId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(NextTopicQuestionsFailedAction(topicId: action.topicId));
        throw e;
      });
  }
  next(action);
}
void refreshTopicQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshTopicQuestionsAction){
    final pagination = selectTopicQuestions(store, action.topicId);
    QuestionService()
      .getByTopicId(action.topicId, pagination.first)
      .then((questions) => store.dispatch(RefreshTopicQuestionsSuccessAction(
        topicId: action.topicId,
        questions: questions.map((e) => e.toQuestionState()))
      ))
      .catchError((e){
        store.dispatch(RefreshTopicQuestionsFailedAction(topicId: action.topicId));
        throw e;
      });
  }
  next(action);
}
//topic questions
