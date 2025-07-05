import 'package:my_social_app/services/question_service.dart';
import 'package:my_social_app/services/question_user_like_service.dart';
import 'package:my_social_app/state/app_state/questions_state/actions.dart';
import 'package:my_social_app/state/app_state/questions_state/selectors.dart';
import 'package:my_social_app/state/app_state/state.dart';
import 'package:redux/redux.dart';

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

//home page questions
void nextHomePageQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextHomePageQuestionsAction){
    final pagination = selectHomePageQuestionPagination(store);
    QuestionService()
      .getHomePageQuestions(pagination.next)
      .then((questions) => store.dispatch(NextHomePageQuestionsSuccessAction(questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(const NextHomePageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
void refreshHomePageQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshHomePageQuestionsAction){
    final pagination = selectHomePageQuestionPagination(store);
    QuestionService()
      .getHomePageQuestions(pagination.first)
      .then((questions) => store.dispatch(RefreshHomePageQuestionsSuccessAction(questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(const RefreshHomePageQuestionsFailedAction());
        throw e;
      });
  }
  next(action);
}
//home page questions

//user questions
void nextUserQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserQuestionsAction){
    final pagination = selectUserQuestions(store,action.userId);
    QuestionService()
      .getByUserId(action.userId, pagination.next)
      .then((questions) => store.dispatch(NextUserQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(NextUserQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void refreshUserQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshUserQuestionsAction){
    final pagination = selectUserQuestions(store,action.userId);
    QuestionService()
      .getByUserId(action.userId, pagination.first)
      .then((questions) => store.dispatch(RefreshUserQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(RefreshUserQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
//user questions

//user solved questions
void nextUserSolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserSolvedQuestionsAction){
    final pagination = selectUserSolvedQuestions(store,action.userId);
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions) => store.dispatch(NextUserSolvedQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(NextUserSolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void refreshUserSolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshUserSolvedQuestionsAction){
    final pagination = selectUserSolvedQuestions(store,action.userId);
    QuestionService()
      .getSolvedQuestionsByUserId(action.userId, pagination.first)
      .then((questions) => store.dispatch(RefreshUserSolvedQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(RefreshUserSolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
//user solved questions

//user unsolved questions
void nextUserUnsolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is NextUserUnsolvedQuestionsAction){
    final pagination = selectUserUnsolvedQuestions(store,action.userId);
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, pagination.next)
      .then((questions) => store.dispatch(NextUserUnsolvedQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(NextUserUnsolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
void refreshUserUnsolvedQuestionsMiddleware(Store<AppState> store, action, NextDispatcher next){
  if(action is RefreshUserUnsolvedQuestionsAction){
    final pagination = selectUserUnsolvedQuestions(store,action.userId);
    QuestionService()
      .getUnsolvedQuestionsByUserId(action.userId, pagination.first)
      .then((questions) => store.dispatch(RefreshUserUnsolvedQuestionsSuccessAction(userId: action.userId, questions: questions.map((e) => e.toQuestionState()))))
      .catchError((e){
        store.dispatch(RefreshUserUnsolvedQuestionsFailedAction(userId: action.userId));
        throw e;
      });
  }
  next(action);
}
//user unsolved questions
